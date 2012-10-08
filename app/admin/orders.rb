# coding: utf-8
ActiveAdmin.register Order do
  menu :label => "Заказы", :priority => 1
  index do
    column "ID" do |order|
      link_to order.id, admin_order_path(order)
    end
    column "Клиент" do |order|
      link_to order.name, admin_order_path(order)
    end
    column "Телефон" do |order|
      link_to order.phone, admin_order_path(order)
    end
    default_actions
  end
end
