# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインしました。'
      redirect_to admin_posts_path
    else
      flash.now[:danger] = 'ログイン出来ませんでした。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end

  private

  def login(email, password)
    @administrator = Administrator.find_by(email: email)
    if @administrator && @administrator.authenticate(password)
      session[:administrator_id] = @administrator.id
      true
    else
      false
    end
  end
end
