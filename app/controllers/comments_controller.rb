class CommentsController < ApplicationController
  before_action :set_item, only: %i[new create]
  def new
      @comment = Comment.new
      @item = Item.find(params[:item_id])
  end

  def create
    @comment = Comment.where(user: current_user).new(comment_params)
    @comment.item = @item
    if @comment.save
      redirect_to activityfeed_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end