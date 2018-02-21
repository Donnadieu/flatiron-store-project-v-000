class StoreController < ApplicationController

  def index
    @items = Item.available_items
    @categories = Category.all
    @current_cart = current_user.current_cart unless !current_user
  end
end
