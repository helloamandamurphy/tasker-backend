class Api::V1::TasksController < ApplicationController
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
    @task.save
    render json: @task, status: 200
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
end
