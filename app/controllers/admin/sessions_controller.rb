# -*- encoding : utf-8 -*-
class Admin::SessionsController < Admin::BaseController
  skip_before_filter :authenticate, :find_notifications
  layout null: true

  def create
    user = User.where(account: params[:account]).first.try(:authenticate, params[:password])
    unless user.blank?
      if user.available?
        user.update(last_signined_at: user.current_signined_at, current_signined_at: Time.now)
        session[:user] = { id: user.id, role: user.role, name: user.name, last_signined_at: user.last_signined_at }
        redirect_to admin_dashboard_path
      else
        redirect_to admin_signin_path, alert: '账号被禁用，无法登录'
      end
    else
      redirect_to admin_signin_path, alert: '账号或密码错误，请检查后重试'
    end
  end

  def destroy
    session[:user] = nil
    redirect_to admin_signin_path
  end
end
