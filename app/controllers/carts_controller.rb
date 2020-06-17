class CartsController < ApplicationController
  def add_item
    session[:cart][params[:id]] ||= 0
    session[:cart][params[:id]] += 1
    redirect_to products_path
  end

  def index; end
end
