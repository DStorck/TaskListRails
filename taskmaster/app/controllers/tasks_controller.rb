class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.where(id: params[:id])
    render :show
  end

  def by_name
    @tasks = Task.where(name: params[:name])
    render :index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_create_params[:task])
    if @task.save
      redirect_to root_path  #ensures that they user can't repost the form
    else
      render :new
    end
  end

  def update
  end

  def delete
  end

  private

  def task_create_params
    params.permit(task: [:name, :description])
  end



end
