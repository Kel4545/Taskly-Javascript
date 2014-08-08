class TasksController < ApplicationController

  def new
    @task = Task.new
    @task_list = TaskList.find(params[:id])
  end

  def create
    @task = Task.new(
      task_list_id: params[:id],
      name: params[:task][:name],
      due_date: parse_due_date(params[:start_date])
    )

    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path

  end

  def parse_due_date(due_date)
    if due_date
      string_date = due_date.to_s
      string_date.to_date
    end

    def update
      @task = Task.find(params[:id])
    end

  end
end



