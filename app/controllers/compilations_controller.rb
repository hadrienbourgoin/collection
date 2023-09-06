class CompilationsController < ApplicationController
  before_action :set_compilation, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @compilations = current_user.compilations.order('updated_at DESC')
      if params[:browse] == 'true'
        @compilations = Compilation.where(public: true).all.order('updated_at DESC').reject { |compilation| current_user.compilations.include?(compilation) }
      elsif params[:new] == 'true'
        @compilations = []
      elsif params[:user_id]
        @compilations = Compilation.where(public: true).where(user_id: params[:user_id]).order('updated_at DESC')
      end
    elsif params[:new] == 'true'
      redirect_to new_user_session_path
    else
      @compilations = Compilation.all.order('updated_at DESC')
    end
    if params[:user_id].present?
      @compilations = Compilation.where(public: true).where(user_id: params[:user_id]).order('updated_at DESC')
    end
    if params[:query].present?
      sql_subquery = <<~SQL
        compilations.name ILIKE :query
        OR compilations.description ILIKE :query
      SQL
      compil = Compilation.all.order('updated_at DESC').where(sql_subquery, query: "%#{params[:query]}%")
      user_by_username = User.find_by(username: params[:query])
      if !user_by_username.nil?
        compil_by_user = Compilation.all.order('updated_at DESC').where(user: user_by_username)
        @compilations = (compil + compil_by_user).uniq
      else
        @compilations = compil
      end
    end
  end

  def show
    @items = @compilation.items.order('updated_at DESC')

    if params[:query].present?
      sql_subquery = <<~SQL
          items.description ILIKE :query
        OR items.name ILIKE :query
        OR CAST(items.year AS VARCHAR(10)) ILIKE :query
      SQL
      @items = @compilation.items.order('updated_at DESC').where(sql_subquery, query: "%#{params[:query]}%")
      @items = @items.to_a

      tag_by_word = Tag.find_by(word: params[:query])
      @compilation.items.each do |item|
        @items << item if item.tags.include?(tag_by_word)
      end
      @items = @items.uniq
    end
  end

  def new
    @compilation = Compilation.new
  end

  def create
    @compilation = Compilation.new(compilation_params)
    @compilation.user = current_user
    if @compilation.save
      save_items
      redirect_to compilation_path(@compilation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @compilation.user = current_user
  end

  def update
    if @compilation.update(compilation_params)
      save_items
      redirect_to compilation_path(@compilation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @compilation.destroy
      redirect_to compilations_path, status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  def advancedsearch
    @compilations = []

    if params[:query].present?
      sql_subquery = <<~SQL
        compilations.name ILIKE :query
        OR compilations.description ILIKE :query
        OR items.description ILIKE :query
        OR items.name ILIKE :query
      SQL
      @compilations = Compilation.joins(:items).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  private

  def set_compilation
    @compilation = Compilation.find(params[:id])
  end

  def compilation_params
    params.require(:compilation).permit(:name, :description, :public)
  end

  def save_items
    params[:compilation][:photos].each do |photo|
      next unless %w[.jpg .jpeg .png .svg .gif .webp].include?(File.extname(photo).downcase)

      new_item = Item.new(name: photo.original_filename, compilation: @compilation, owned: true)
      new_item.photo.attach(io: photo, filename: photo.original_filename, content_type: photo.content_type)
      new_item.save
    end
  end
end
