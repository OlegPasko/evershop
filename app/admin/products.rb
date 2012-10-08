# coding: utf-8
ActiveAdmin.register Product do
  
    menu :label => "Продукты", :priority => 2
    index do
      column "ID" do |product|
        link_to product.id, admin_product_path(product)
      end
      column "Название" do |product|
        link_to product.title, admin_product_path(product)
      end
      column "Цена" do |product|
        link_to product.price, admin_product_path(product)
      end
      default_actions
    end
    
    show do |product|
      attributes_table do
        row :id
        row :title
        row :price
        row :shortdescription
        row :image do
          image_tag(product.image_url(:thumb3))
        end
        row :description
        
        row 'Категории' do |n|
           product.values.map(&:value).join("<br />").html_safe
        end
      end
      active_admin_comments
    end
  
  form do |f|
    f.inputs "Основные значения" do
      f.input :title
      f.input :price, :as => :number
      f.input :shortdescription
      f.input :description, :as => :text
      f.input :image, :as => :file
      
      
    end
    f.has_many :product_values do |v|
      v.inputs "Категории" do
        if !v.object.nil?
          v.input :_destroy, :as => :boolean, :label => "Удалить?"
        end
  
        v.input :value
        
      end
    end
    #f.has_many :values do |value|
    #  value.inputs "Значения" do
    #    value.input :value
    #  end
    #end
     f.buttons
  end
end
