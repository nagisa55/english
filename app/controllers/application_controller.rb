# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_logged_in
    unless logged_in?
      flash[:danger] = 'ログインしてください。'
      redirect_to login_path
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
