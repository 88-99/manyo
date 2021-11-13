class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[ new create ]

  def new
    if logged_in?
      redirect_to tasks_path, notice: "ログイン中のためアカウントは作成できません。"
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: "ユーザーを登録しました！"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
