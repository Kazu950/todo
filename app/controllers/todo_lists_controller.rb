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
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to todo_lists_path, notice: "タスク「#{@task.name}」を削除しました。"
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to todo_lists_path, notice: "タスク「#{@task.name}」を作成しました！"
    else
      render :new
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to todo_list_path, notice: "タスク#{task.name}を更新しました"
    else
      render :edit
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end
end
