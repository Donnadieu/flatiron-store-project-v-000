class CartsController < ApplicationController

  def show
    @current_cart = Cart.find(params[:id])
  end

  def checkout
    @current_cart = Cart.find(params[:id])

    check_out(@current_cart)

    redirect_to cart_path(@current_cart)
  end
end
