class CompilationsController < ApplicationController
  before_action :set_compilation, only: [:show, :edit, :update]

  def index
    @compilations = Compilation.all
    if params[:browse] == "true"
      @browse = true
    else
      @browse = false
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

  private

  def set_compilation
    @compilation = Compilation.find(params[:id])
  end

  def compilation_params
    params.require(:compilation).permit(:name, :description, :public)
  end
end
