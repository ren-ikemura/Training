class Admin::UsersController < ApplicationController
  # /admin/users　 一覧画面
  def index
    @users = User.all
  end

  # /admin/users/[id] 詳細画面
  def show
    @user = User.find(params[:id])
  end

  # /admin/users/new　 新規作成画面
  def new
    @user = User.new
  end

  # /admin/users (POST) 新規作成処理
  def create
    @user = User.new(user_params)
    if @user.save
      # admin_user_url(@user) = /admin/users/[id]
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  # /admin/users/[id]/edit　編集画面
  def edit
    @user = User.find(params[:id])
  end

  # /admin/users/[id] (PATCH/ PUT)　アップデート
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 一覧ページ
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を変更しました"
    else
      render :edit
    end
  end

  # /admin/users/[id] (DELETE)　削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end