class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  # Finds user by session ID if they are currently logged in
  def current_user
    User.find_by(id: session[:user_id])
  end

# Calls the above function to determine wether a user is logged in
  def logged_in?
    !!current_user
  end
end
