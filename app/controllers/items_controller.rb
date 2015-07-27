class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(session[:user_id])
    @item = Item.new(name:        item_params[:name],
                     cost:        item_params[:cost],
                     end_date:    item_params[:end_date],
                     description: item_params[:description],
                     user_id:     session[:user_id])
    if @item.save
      redirect_to user_path(@user.id)
    else
      redirect_to items_path
    end
  end

  def show
    @bid = Bid.new
    @item = Item.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    redirect_to user_path(@user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @user = User.find(session[:user_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@user.id)
  end

  private

    def item_params
      params.require(:item).permit(:name, :cost, :end_date, :description)
    end

end
