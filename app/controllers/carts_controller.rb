class CartsController < ApplicationController
  def add_item
    session[:cart][params[:id]] ||= 0
    session[:cart][params[:id]] += 1
    redirect_back_or products_path
  end

  def index; end

  def remove_from_cart
    session[:cart].delete(params[:id])
    redirect_to carts_path
  end
end
