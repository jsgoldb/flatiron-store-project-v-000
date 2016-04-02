class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      @cart = current_user.current_cart
    else
      @cart = Cart.create
    end
    LineItem.create(item_id: params[:item_id], cart_id: @cart.id)
    current_user.current_cart = @cart
  end


end
