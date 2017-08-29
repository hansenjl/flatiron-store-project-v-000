require 'pry'
class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.items.each do |item|
      total = total + item.price
    end
    total
  end

  def add_item(item)
    lineitem = LineItem.find_by(cart_id: self.id, item_id: item)
    if lineitem
      #change quantity
      lineitem.quantity = lineitem.quantity + 1
      lineitem
    else
      lineitem = LineItem.new(cart_id: self.id, item_id: item)
    end

  end
end
