# coding: utf-8
class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderMailer.user_email(@order).deliver if @order.email
        OrderMailer.admin_email(@order).deliver
        format.html {redirect_to root_url, notice: "Спасибо за заказ! Мы свяжемся с Вами в ближайшее время."}
        format.json {render json: @order, status: :created, location: @order}
      else
        @cart = current_cart
        format.html {render action: "new"}
        format.json {render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end
end