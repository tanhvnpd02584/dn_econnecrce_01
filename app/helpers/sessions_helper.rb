module SessionsHelper
  # create a session store in cookie t in browser and enpire when browser ends
  def log_in user
    session[:user_id] = user.id
  end

  # return true if current user = true and current user == true
  def current_user? user
    user && user == current_user
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  # return true if current_user.nil? = false
  def logged_in?
    current_user.present?
  end

  # delete session, return @current_user = nil, forget user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # redirect to login if user not logged in
  def logged_in_user
    unless logged_in?

      flash[:danger] = t "login.text_login_pls"
      redirect_to login_url
    end
  end

  # store location in this time
  def store_location
    session[:forwarding_url] = request.original_url if request.post?
  end

  def redirect_back_or default
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # tinh total tien
  def total(quantity, unit_price)
    @total = quantity * unit_price
  end

  # duyet session to retrive id and quantity
  def find_product id
    @product = Product.find_by(id)
    return if @product

    flash[:danger] = t "products.text_error_not_found"
    redirect_to root_url
  end

  def sub_total
    sum = 0
    session[:cart].each do |id, quantity|
      find_product id
      sum += total(quantity, @product.unit_price)
    end
    sum
  end
end
