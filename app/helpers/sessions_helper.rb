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

  # tinh total tien
  def total(quantity, unit_price)
    @total = quantity * unit_price
  end

  # duyet session to retrive id and quantity
  def find_product id
    @product = Product.where(id: id).first
  end
end
