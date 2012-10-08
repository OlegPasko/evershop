# coding: utf-8
class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @order = Order.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end
  
  def index
    @cart = Cart.find(session[:cart_id])
    @order = Order.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end
  
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html {redirect_to root_url, notice: 'Корзина очищена!'}
      format.json { head :ok }
    end
  end

end