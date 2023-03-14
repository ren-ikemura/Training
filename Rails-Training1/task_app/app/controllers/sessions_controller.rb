class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    # 引数で受け取ったパスワードをハッシュ化し、
    # Userオブジェクト内部に保存されているdigestと一致するか調べる
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
