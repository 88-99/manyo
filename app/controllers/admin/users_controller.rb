class Admin::UsersController < ApplicationController
skip_before_action :login_required, only: %i[ new create ]
# before_action :check_admin
before_action :set_user, only: %i[ show edit updete destroy ]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザーを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # def check_admin
  #   redirect_to root_path, notice: "権限がありません", current_user.admin?
  # end
end
