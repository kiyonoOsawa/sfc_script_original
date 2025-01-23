class HomeController < ApplicationController
  def index
    @tasks = Task.where(user_id: current_user.id)
    # @tasks = Task.find_by(params[:user_id])
    # @user_tasks = @tasks.find_by(params[:user_id])
  end

  def new
    @task = Task.new
  end
  def show
    @user = User.find(params[:id]) # ユーザー情報を取得
  end

  def create
    Task.create(task_parameter)
    redirect_to tasks_path
  end

  def destroy
    @task = Blog.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "削除しました"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(blog_parameter)
      redirect_to tasks_path, notice: "編集しました"
    else
      render "edit"
    end
  end

  private

  def task_parameter
    params.require(:task).permit(:taskName, :start_time, :content)
  end
end
