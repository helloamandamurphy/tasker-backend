class Api::V1::TasksController < ApplicationController

  before_action :set_list

  def index
    @tasks = Task.all
    render json: @tasks, :except => [:created_at, :updated_at], status: 200
  end

  def show
    @task = Task.find(params[:id])
    render json: @task, status: 200
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: 200
    else
      json: {error: "Error creating list"}
    end
  end

  def update
    @task = Task.find(params[:id])
    render json: @task, status: 200
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete

    render json: {taskId: @task.id}
  end

  private

  def set_list
  end

  def task_params
    params.require(:task).permit(:name, :est_time)
  end
end
