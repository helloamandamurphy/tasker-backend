class Api::V1::ListsController < ApplicationController

  # before_action :set_user

  def index
    # @lists = List.all
    # @lists = @user.lists
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
    find_user_list
    # @list = @user.lists.find_by(id: params[:id])
    # @list = List.find(params[:id])
    render json: @list, status: 200
  end

  def create
    # binding.pry
    @list = List.new(list_params)
    # This is not currently saving, because there is no User associated with it.
    #@list = @account.lists.build(list_params)
    if @list.save
      render json: @list, status: 200
    else
      render json: {error: "Error creating list"}
    end
  end

#Need some sort of method (probably in List.rb) that confirms that updates can only be made by the list owner.
  def update
    find_user_list
    # @list = List.find(params[:id])
    render json: @list, status: 200
  end

  def destroy
    find_user_list
    # @list = List.find(params[:id])
    @list.delete

    render json: {listId: @list.id}
  end

  private
  # This sets the user based on the list's user id.
    def set_user
      @user = User.find(params[:user_id])
    end
    
  # This sets the list by finding the list id belonging to the user.
    def find_user_list
      @list = @user.lists.find_by(id: params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :start_time, :end_time, tasks_attributes: [:name, :est_time])
    end
end
