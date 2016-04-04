class LineItemsController < ApplicationController

  def create
    @user = current_user
    if @user.current_cart
      @cart = @user.current_cart
    else
      @cart = @user.carts.create
    end
    LineItem.create(item_id: params[:item_id], cart_id: @cart.id)
    @user.current_cart = @cart
  end


end
