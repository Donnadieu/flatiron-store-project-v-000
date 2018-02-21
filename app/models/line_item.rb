class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def price
    self.item.price
  end
end
