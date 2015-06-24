module SessionsHelper
  def logged_in?
    session[:user_id] != nil #returns true or false to see if someone is logged in
  end
end
