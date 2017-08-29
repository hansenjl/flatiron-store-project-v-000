class LineItemsController < ApplicationController


  def create
    if current_user && current_user.current_cart
      line_item = current_user.current_cart.add_item(params[:item_id])
    elsif current_user
      current_user.current_cart = Cart.new
      current_user.save
      line_item = current_user.current_cart.add_item(params[:item_id])
    end

    if line_item.save
      redirect_to cart_path(current_user.current_cart)
      flash[:notice] = 'Item sucessfully added to cart!'
    else
      redirect_to store_path
    end
  end



end
