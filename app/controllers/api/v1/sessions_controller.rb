class Api::V1::SessionsController < ApplicationController
  # Uses Login credentials to create a session if email and password match
  # the existing User info in the database or returns error
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

# Calls the logged_in? method from ApplicationController to determine
# if there is a current user, and renders the JSON for that user or
# renders an error message.
  def get_current_user
    if logged_in?
      render json: current_user
    else
      render json: {
        error: "No one logged in."
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "Successfully logged out."
    }, status: :ok
  end
end
