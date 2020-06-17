class ProductsController < ApplicationController
  before_action :find_product, only: :show

  def index
    @products = Product.all
                       .paginate(page: params[:page],
                                 per_page: Settings.per_page_user)
  end

  def show; end

  private

  def find_product
    @product = Product.find_by(params[:id])
  end
end
