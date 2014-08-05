class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new
    @task_list = TaskList.new
  end

  def create
    task = TaskList.create(name: params[:task_list][:name])
    if task.errors.messages == {}
      flash[:notice] = "Task List created successfully!"
      redirect_to root_path
    else
      @task_list = task
      render :new
    end
  end

  def edit

  end
end