class PurchasesController < ApplicationController
  before_action :logged_in_user, only: %i(create new)
  before_action :cart_is_empty?, only: :create

  def new
    @purchase = Purchase.new
  end

  def create
    ActiveRecord::Base.transaction do
      @purchase = current_user.purchases.build(purchase_params)
      @purchase.save!
      add_products_to_detailspurchase @purchase.id
      session[:cart] = {}
      flash[:success] = t "checkout.add_success"
      redirect_to root_url
    rescue ActiveRecord::RecordInvalid
      render :new
    rescue => e
      flash[:danger] = t "checkout.errors_save"
      redirect_to root_url
    end
  end

  private

  # insert details purchase in to details purchase
  def add_products_to_detailspurchase purchase_id
    session[:cart].each do |id, quantity|
      find_product id
      @product
        .detailpurchases
        .create(quantity: quantity, purchase_id: purchase_id)
    end
  end

  # check cart is emty?
  def cart_is_empty?
    return unless session[:cart].empty?

    store_location
    flash[:danger] = t "checkout.error_cart_empty"
    redirect_to products_path
  end

  # params purchases
  def purchase_params
    params.require(:purchase).permit(:name, :phone_number, :address)
  end
end
