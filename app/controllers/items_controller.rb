class ItemsController < ApplicationController
  before_action :set_compilation, only: %i[new create edit update]

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
    @item.compilation = @compilation

    if @item.save
      photo = params[:item][:photo]
      unless photo.nil?
        @item.photo.purge
        @item.photo.attach(io: photo, filename: photo.original_filename, content_type: photo.content_type)
      end

      tags = params[:item][:tags].split
      if tags.count.positive?
        tags.each do |tag|
          new_tag = Tag.find_by(word: tag)
          new_tag = Tag.create(word: tag) if new_tag.nil?
          ItemsTag.create(item: @item, tag: new_tag)
        end
      end

      redirect_to compilation_path(@item.compilation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      photo = params[:item][:photo]
      unless photo.nil?
        @item.photo.purge
        @item.photo.attach(io: photo, filename: photo.original_filename, content_type: photo.content_type)
      end

      tags = params[:item][:tags].split
      if tags.count.positive?
        tags.each do |tag|
          new_tag = Tag.find_by(word: tag)
          new_tag = Tag.create(word: tag) if new_tag.nil?
          ItemsTag.create(item: @item, tag: new_tag)
        end
      end

      redirect_to compilation_path(@item.compilation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to compilation_path(@item.compilation), status: :see_other
    else
      render :back, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :year, :owned)
  end

  def set_compilation
    @compilation = Compilation.find(params[:compilation_id])
  end
end
