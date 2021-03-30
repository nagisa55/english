class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_logged_in
    unless logged_in?
      flash.now[:danger] = "ログインしてください。"
      redirect_to login_path
    end
  end

end
