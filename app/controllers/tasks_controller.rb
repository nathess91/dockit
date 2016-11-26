class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks.order(is_high_priority: :desc)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)

    if @task.valid?
      redirect_to '/home'
    else
      redirect_to :back
    end

  end

  def edit
    @task = Task.find(params[:id])
	end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to '/home'
    else
      redirect_to :back
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to '/home'
    else
      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:text, :is_high_priority, :date_due)
  end

end
