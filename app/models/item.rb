class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items


  def self.available_items
    avail_items = []
    Item.all.each do |item|
      if item.inventory > 0
        avail_items << item
      end
    end
    avail_items
  end


  def sold(cart)
    items_in_cart = self.line_items.find_by(cart_id: cart.id)
    self.inventory = self.inventory - items_in_cart.quantity
    self.save
  end

end
