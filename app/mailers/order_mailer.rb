# coding: utf-8
class OrderMailer < ActionMailer::Base
  default from: "olegpasko@gmail.com"
  
  def user_email(order)
    @order = order
    @url  = "http://optilens.com.ua"
    mail(:to => order.email, :subject => "Ваш заказ на Optilens.com.ua")
  end
  
  def admin_email(order)
    @order = order
    @url  = "http://optilens.com.ua/admin"
    mail(:to => "olegpasko@gmail.com", :subject => "Новый заказ на optilens.com.ua")
  end
  
end
