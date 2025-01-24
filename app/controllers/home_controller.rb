class HomeController < ApplicationController
  def index
    @tasks_user = Task.where(user_id: current_user.id)
    @today = Time.current
    @tasks = @tasks_user.where("start_time > ?", @today) # @today以降のstart_timeを持つタスクを取得

    # タスクの期間を計算（@todayからstart_timeまで）
    # @tasks_with_intervals = @tasks.map do |task|
    #   {
    #     task: task,
    #     days: (@today.to_date..task.start_time.to_date).to_a # @todayからstart_timeまでの期間
    #   }
    # end

    # 日付ごとにタスクを整理
    @tasks_by_date = []
    @tasks_user.each do |task|
      # 日付をYYYY-MM-DD形式の配列で取得
      days = (@today.to_date..task.start_time.to_date).map(&:to_s)

      days.each do |day|
        @tasks_by_date << task.dup.tap { |t| t.start_time = Date.parse(day) }
      end
    end

    # @date_array = (@today..@tasks_user.start_time).to_a

    puts "uuuuuuuu"
    puts @today
    puts "eeeeeee"
    puts @date_array
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

  def friend_list
    @users = User.all
  end


  # def refresh_date
  #   @today = Time.current
  #   @tasks = Task.where(user_id: current_user.id)

  #   # 差分の計算をここで行うこともできます
  #   @tasks_with_diff = @tasks.map do |task|
  #     if task.start_time > @today
  #       { task: task, diff: (task.start_time.to_date - @today.to_date).to_i }
  #     end
  #   end.compact

  #   # index.html.erb に戻る
  #   render :index
  # end
end
