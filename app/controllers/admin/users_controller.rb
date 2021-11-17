class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :check_admin

  def index
    @users = User.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザを登録しました！"
    else
      render :new
    end
  end

  def show
    @tasks = @user.tasks
  end

  def edit
  end

  def update
    # if (@user.admin == false && User.where(admin: true).size == 1) && @user == User.find_by(admin:true) <#% 更新されてしまう %>
    #   redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」は、管理者がいなくなるため更新できません。"
    # else
    #   @user.update(user_params)
    #     redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を更新しました！"
    # elsif
    #   render edit <#% エラーになる %>
    # end


    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if User.where(admin: true).count <= 1 && @user.admin == true
      redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」は、管理者がいなくなるため削除できません。"
    else
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を削除しました！"
    end
    # @user.destroy <#% 自分が書いたコード %>
    # if User.where(admin: true).count <= 1 && @user.admin == true
    #   redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」は、管理者がいなくなるため削除できません。"
    # else
    #   redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を削除しました！"
    # end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
