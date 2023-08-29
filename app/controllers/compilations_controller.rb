class CompilationsController < ApplicationController
  before_action :set_compilation, only: [:show, :edit, :update]

  def index
    @compilations = Compilation.all
    @browse = true if params[:browse] == "true"
    @new = true if params[:new] == "true"
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

  private

  def set_compilation
    @compilation = Compilation.find(params[:id])
  end

  def destroy
    @compilation = Compilation.find(params[:id])
    @compilation.destroy
    redirect_to compilations_path, status: :see_other
  end

  private

  def compilation_params
    params.require(:compilation).permit(:name, :description, :public)
  end
end
