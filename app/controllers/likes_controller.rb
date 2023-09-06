class LikesController < ApplicationController
  before_action :set_item, only: %i[create]
  skip_before_action :verify_authenticity_token

  def create
    @likes = Like.where(user: current_user, item: @item)
    @total = Like.where(item: @item)
    if @likes.any?
      @likes.first.destroy
      render json: { action: "destroy", total: @total.count }
    else          
      @like = Like.create!(user: current_user, item: @item)
      render json: { action: "create", total: @total.count }
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
