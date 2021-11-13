module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, notice: "権限がありません。"
    end
  end
end
