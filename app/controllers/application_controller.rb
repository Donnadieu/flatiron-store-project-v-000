class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_or_create_current_cart
    if !current_user.current_cart
      current_cart = current_user.carts.create
      current_user.current_cart = current_cart
      current_user.save
    else
      current_cart = current_user.current_cart
    end
    current_cart
  end

  def check_out(current_cart)
    current_cart.update(status: "submitted")

    Order.create(user_id: current_user.id, total: @current_cart.total)
    Item.update_inventory(@current_cart)

    current_user.current_cart = nil
    current_user.save
  end


end
