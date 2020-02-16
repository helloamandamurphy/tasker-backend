class Api::V1::ListsController < ApplicationController
  def index
    @lists = List.all
    render json: @lists, :include => {:tasks => {:except => [:created_at, :updated_at]}}, :except => [:created_at, :updated_at], status: 200
  end

  def show
    @list = List.find(params[:id])
    render json: @list, status: 200
  end

  def create
    @list = List.new(list_params)
    @list.save
    render json: @list, status: 200
  end

  def update
    @list = List.find(params[:id])
    render json: @list, status: 200
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete

    render json: {listId: @list.id}
  end


    # private
      # def list_params
      #   params.require(:list).permit(:name, :lat, :long, photos_attributes: [:url])
      # end
end
