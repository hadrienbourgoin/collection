class CompilationsController < ApplicationController
  def index
    @compilations = Compilation.all
    if params[:browse] == "true"
      @browse = true
    else
      @browse = false
    end
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
