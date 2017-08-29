class CartsController < ApplicationController
  def checkout
    @cart = current_cart
    @cart.status = "submitted"
    current_cart.items.each do |item|
      item.sold(@cart)
    end


    current_user.current_cart = nil
    current_user.save

    redirect_to cart_path(@cart)
  end
end
