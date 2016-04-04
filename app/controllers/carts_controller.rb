class CartsController < ApplicationController

  def index
  end

  def show
    @cart = current_user.current_cart
    @user = current_user
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def checkout
    @cart = Cart.find(params[:id])
    @user = current_user
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @user.current_cart = nil
    @user.save
    redirect_to cart_path(@cart)
  end

end
