class LineItemsController < ApplicationController

  def create
    @current_cart = find_or_create_current_cart

    @current_cart.add_item(params[:item_id]).save

    redirect_to cart_path(@current_cart)
  end
end
