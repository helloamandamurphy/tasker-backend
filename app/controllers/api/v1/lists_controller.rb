class Api::V1::ListsController < ApplicationController

  # before_action :set_user

  def index
    @lists = List.all
    # @lists = @user.lists
    render json: @lists, status: 200
  end

  def show
    find_user_list
    # @list = @user.lists.find_by(id: params[:id])
    # @list = List.find(params[:id])
    render json: @list, status: 200
  end

  def create
    @list = @account.lists.build(list_params)
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
    def set_user
      @user = User.find(params[:user_id])
    end

    def find_user_list
      @list = @user.lists.find_by(id: params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :end_time, tasks_attributes: [:name, :est_time])
    end
end
