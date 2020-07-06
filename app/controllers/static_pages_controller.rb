class StaticPagesController < ApplicationController
  def home
    @products = Product.top_product
  end
end
