class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @task = Task.order(:name)
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(
      name: params[:task_list][:name]
    )
    if @task_list.save
      flash[:notice] = "Task List was created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task_list = TaskList.find(
      params[:id])
  end

  def update
    if TaskList.find(
      params[:id]).update(name: params[:task_list][:name])
      flash[:notice] = "Your tasks list was successfully updated!"
      redirect_to root_path
    else
      render :new
    end

  end
end


