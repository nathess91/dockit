class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks.order(is_high_priority: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @user = current_user
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
    @user = current_user
    @task = Task.find(params[:id])
	end

  def update
    @user = current_user
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to '/home'
    else
      redirect_to :back
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "Task deleted successfully"
      redirect_to '/home'
    else
      flash[:error] = @task.errors.full_messages.join(". ")
      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:text, :is_high_priority, :date_due, :user_id)
  end

end
