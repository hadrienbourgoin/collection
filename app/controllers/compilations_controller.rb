class CompilationsController < ApplicationController
  before_action :set_compilation, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @compilations = current_user.compilations
      if params[:browse] == 'true'
        @compilations = Compilation.where(public: true).all.reject { |compilation| current_user.compilations.include?(compilation) }
      elsif params[:new] == 'true'
        @compilations = []
      end
    elsif params[:new] == 'true'
      redirect_to new_user_session_path
    else
      @compilations = Compilation.all
    end
  end

  def show
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
    @compilation.items.each do |item|
      Cloudinary::Uploader.destroy("development/#{item.photo.key}")
    end
    if @compilation.destroy
      redirect_to compilations_path, status: :see_other
    else
      render :back, status: :unprocessable_entity
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
      next unless %w[.jpg .jpeg .png .svg .gif].include?(File.extname(photo).downcase)

      new_item = Item.new(name: photo.original_filename, compilation: @compilation, owned: true)
      new_item.photo.attach(io: photo, filename: photo.original_filename, content_type: photo.content_type)
      new_item.save
    end
  end
end
