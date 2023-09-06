class FollowsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    p params
    
    followed_id = params['follow']['followed_id']
    @follows = Follow.new(follow_params)
    @follows = Follow.where(follower_id: current_user.id, followed_id: followed_id )
    if @follows.any?
      @follows.first.destroy
      render json: { action: "destroy" }
    else
      @follow = Follow.new(follow_params)
      @follow.follower_id = current_user.id
      @follow.save
      
      render json: { action: "create"}
    end

  end

  private

  def follow_params
    params.require(:follow).permit(:followed_id)
  end
end
