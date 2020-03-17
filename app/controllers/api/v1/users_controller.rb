class Api::V1::UsersController < ApplicationController
  # def index
  #   @users = User.all
  #   render json: @users, status: 200
  # end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: :created
    else
      resp = {
        error: @user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   render json: @user, status: 200
  # end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.delete
  #
  #   render json: {userId: @user.id}
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
