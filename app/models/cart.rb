class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    line_item = line_items.find_or_initialize_by(item_id: item_id)
    line_item.quantity += 1 unless !line_item.id
    line_item
  end

  def total
    self.line_items.map {|line_item| line_item.price * line_item.quantity}.sum
  end  
end
