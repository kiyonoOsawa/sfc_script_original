class SessionsController < ApplicationController
  def new
    # ログインフォームを表示
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password]) # has_secure_passwordを使用
      session[:user_id] = user.id
      redirect_to home_path(user), notice: "ログインに成功しました。"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました。"
  end
end
