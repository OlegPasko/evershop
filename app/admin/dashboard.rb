# coding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    #Here is an example of a simple dashboard with columns and panels.
     columns do
       column do
        panel "Последние заказы" do
          ul do
            Order.recent(20).map do |order|
              li link_to(order.id.to_s+" - "+order.name+", тел. "+order.phone, admin_order_path(order))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
    
  end # content
end
