class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status = completed_yet(@task.completed)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path, status: :see_other
  end

  private

  def completed_yet(task_status)
    @completion_status = ''

    if task_status == true
      @completion_status = 'This task is completed.'
    else
      @completion_status = 'This task is not completed yet.'
    end

    @completion_status
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
