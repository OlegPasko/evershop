# coding: utf-8
class OrderMailer < ActionMailer::Base
  default from: "chernogal.vadim@mail.ru"
  
  def user_email(order)
    @order = order
    @url  = "http://teaco.com.ua"
    mail(:to => order.email, :subject => "Спасибо за заказ на Teaco.com.ua")
  end
  
  def admin_email(order)
    @order = order
    @url  = "http://teaco.com.ua/admin"
    mail(:to => "chernogal.vadim@mail.ru", :subject => "Новый заказ на teaco.com.ua")
  end
  
end
