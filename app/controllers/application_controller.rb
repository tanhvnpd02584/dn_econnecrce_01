class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_cart
  include SessionsHelper
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  private

  def set_cart
    session[:cart] ||= {}
  end
end
