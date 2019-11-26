class TodoListsController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to todo_lists_path, notice: "#{@task.name}"
    else
      render :new
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end
end
