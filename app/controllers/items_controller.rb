class ItemsController < ApplicationController
  before_action :set_compilation, only: %i[index new create update ]

  def activity_feed
    if user_signed_in?
      @follows = Follow.where(follower: current_user)
      users = []
      # verification si on follow un user
      if @follows.count.positive? 
        @follows.each do |follow| 
          users << follow.followed
        end
        compilations = []
        # recuperation des collection de chaque user
        users.each do |user|
          user.compilations.each do |compilation|
            compilations << compilation
          end
        end
        # recuperation des items de chaque user
        items_array = []
        compilations.each do |compilation|
          unless compilation.items.nil?
            compilation.items.each do |item|
              items_array << item
            end
          end
        end
        @items = items_array
      else
        @items = Item.all.order("updated_at DESC")  
      end
    else
      @items = Item.all.order("updated_at DESC")
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.compilation = compilation_id

    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :year, :owned)
  end

  def set_compilation
    @compilation = Compilation.find([:compilation_id])
  end
end
