class CompilationsController < ApplicationController
  def index
    @compilations = Compilation.all
    @browse = true if params[:browse] == "true"
    @new = true if params[:new] == "true"
  end

  private

  def compilation_params
    params.require(:compilation).permit(:name, :description, :public)
  end
end
