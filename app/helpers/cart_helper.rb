module CartHelper

  def add_to_cart_button(item_id)
    button_to 'Add to Cart', line_items_path(item_id: item_id) unless !user_signed_in?
  end  
end
