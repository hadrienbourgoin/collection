class ItemsController < ApplicationController
  before_action :set_compilation, only: %i[index new create update ]

  def activity_feed
    @items = Item.all.order("created_at DESC")
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
