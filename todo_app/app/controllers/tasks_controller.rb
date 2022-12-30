class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: tasks }
  end

  def show
    task = Task.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded post', data: task }
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: { status: 'SUCCESS', data: task }
    else
      render json: { status: 'ERROR', data: task.errors }
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      render json: { status: 'SUCCESS', data: task }
    else
      render json: { status: 'ERROR', data: task.errors }
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: { status: 'SUCCESS UPDATE', data: task }
    else
      render json: { status: 'ERROR UPDATE', data: task.errors }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
