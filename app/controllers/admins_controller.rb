class AdminsController < ApplicationController
  layout "admin/layouts/application"
  before_action :require_admin

  include SessionsHelper

  def require_admin
    return if current_user&.role?

    redirect_to root_url
  end
end
