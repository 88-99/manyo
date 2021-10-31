class TasksController < ApplicationController
before_action :set_task, only: %i[ show edit update destroy ]



  # def index
  #   if params[:sort_expired].present?
  #     @tasks = Task.all.order(deadline: "DESC")
  #   else
  #     @tasks = Task.all
  #   end
  # end

  # def index
  #   if params[:task].present?
  #     @tasks = Task.where('title LIKE ?', "%#{params[:task][:search]}%")
  #   end
  # end

  def index
    @tasks = Task.all
    @tasks = @tasks.order(deadline: "DESC") if params[:sort_expired].present?
    @tasks = @tasks.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @tasks = @tasks.where(status: params[:status]) if params[:status].present?
  end

  def new
    @task = Task.new
  end

  def create
    # @task = current_user.tasks.build(task_params)
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました！"
    else
      render :new
    end
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status)
  end
end
