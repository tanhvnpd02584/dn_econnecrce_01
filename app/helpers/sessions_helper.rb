module SessionsHelper
  # create a session store in cookie t in browser and enpire when browser ends
  def log_in user
    session[:user_id] = user.id
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
end
