class TasksController < ApplicationController

  def new
  @task = Task.new
    @task_list = TaskList.find(params[:id])
  end

  def create
    @task = Task.new(
      task_list_id: params[:id],
      name: params[:task][:name]
    )

      if @task.save
        flash[:notice] = "Task was created successfully!"
        redirect_to root_path
      else
        render :new
      end
  end
  end





