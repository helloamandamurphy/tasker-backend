class Api::V1::ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    if logged_in?
      @lists = current_user.lists
      render json: @lists, status: 200
    else
      render json: {
        error: "You must be logged in to view lists."
      }
    end
  end

  def show
    render json: @list, status: 200
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      render json: @list, status: :created
    else
      error_resp = {
        error: @list.errors.full_messages.to_sentence
      }
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      render json: @list, status: :ok
    else
      error_resp = {
        error: @list.errors.full_messages.to_sentence
      }
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.destroy
      render json:  { data: "Your list was successfully deleted." }, status: :ok
    else
      error_resp = {
        error: "Your list could not be found or deleted."
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :start_time, :end_time, tasks_attributes: [:name, :est_time])
    end
end
