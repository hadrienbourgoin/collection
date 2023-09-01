class CompilationsController < ApplicationController
  before_action :set_compilation, only: %i[show edit update]

  def index
    @compilations = Compilation.all
    if params[:browse] == 'true'
      @browse = true
      if user_signed_in?
        @compilations = Compilation.all.reject { |compilation| current_user.compilations.include?(compilation) }
      end
    elsif params[:new] == 'true'
      @compilations = []
      @new = true
      @must_log_in = true unless user_signed_in?
    end
  end

  def show
    @compilation.user = current_user
  end

  def new
    @compilation = Compilation.new
  end

  def create
    @compilation = Compilation.new(compilation_params)
    @compilation.user = current_user
    if @compilation.save
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
      redirect_to compilation_path(@compilation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @compilation = Compilation.find(params[:id])
    @compilation.destroy
    redirect_to compilations_path, status: :see_other
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
end
