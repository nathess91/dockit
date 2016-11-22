class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)

    if @task.valid?
      redirect_to '/home'
    else
      render :new
    end

  end

  def update
    @task = current_user.tasks.find(params[:id]).update_attributes(task_params)
    @task.save
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:text, :is_high_priority, :date_due)
  end

end
