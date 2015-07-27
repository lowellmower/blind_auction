class BidsController < ApplicationController

  def create
    p params
    @item = Item.find(params[:item_id])
    @bid = @item.bids.new(ammount: bid_params[:ammount],
                          user_id: session[:user_id],
                          item_id: bid_params[:item_id])
    if @bid.save
      flash[:notice] = "Thank you for your bid!"
      redirect_to :back
    else
      flash[:notice] = "Your bid did not save :("
      redirect_to :back
    end

  end

  private

  def bid_params
    params.require(:bid).permit(:ammount, :item_id)
  end

end