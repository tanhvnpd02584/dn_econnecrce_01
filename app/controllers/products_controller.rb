class ProductsController < ApplicationController
  before_action :find_product, only: :show

  def index
    @products = Product.search(params[:term])
                       .paginate(page: params[:page],
                                 per_page: Settings.per_page_user)
    @categories = Category.sorted
  end

  def show; end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
    return if @product

    flash[:danger] = t "products.text_error_not_found"
    redirect_to root_url
  end
end
