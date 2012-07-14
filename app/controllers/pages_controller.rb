class PagesController < ApplicationController
  def index
    @products = Product.recent.limit(4)
  end
end
