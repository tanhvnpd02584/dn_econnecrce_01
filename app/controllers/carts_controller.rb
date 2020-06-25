class CartsController < ApplicationController
  def add_item
    session[:cart][params[:id]] ||= 0
    session[:cart][params[:id]] += 1
    redirect_to request.referer || products_path
  end

  def sub_item
    session[:cart][params[:id]] ||= 0
    if session[:cart][params[:id]] != 1
      session[:cart][params[:id]] -= 1
      redirect_to carts_path
    else
      remove_from_cart
    end
  end

  def index; end

  def remove_from_cart
    session[:cart].delete(params[:id])
    redirect_to carts_path
  end
end
