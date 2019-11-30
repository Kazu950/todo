class TodoListsController < ApplicationController
  def index
    @tasks = Task.all
    sort(@tasks)
  end

  def sort(tasks)
    @task = []
    tasks.each do |task|
      if task.priority == "高"
        @task << task
      end
    end
    tasks.each do |task|
      if task.priority == "中"
        @task << task
      end
    end
    tasks.each do |task|
      if task.priority == "低"
        @task << task
      end
    end
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
    elsif @task.name.empty? && @task.priority.empty?
      flash.now[:notice] = 'タスク名と優先度を入力してください'
      render :new
    elsif @task.name.empty?
      flash.now[:notice] = 'タスク名を入力してください'
      render :new
    elsif @task.priority.empty?
      flash.now[:notice] = '優先度を入力してください'
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

  def search
    @tasks = Task.search(params[:search])
    sort(@tasks)
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :priority)
  end
end
