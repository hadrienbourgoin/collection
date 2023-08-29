class CompilationsController < ApplicationController
  def index
    @compilations = Compilation.all
    if params[:browse] == "true"
      @browse = true
    else
      @browse = false
    end
  end

  private

  def compilation_params
    params.require(:compilation).permit(:name, :description, :public)
  end
end
