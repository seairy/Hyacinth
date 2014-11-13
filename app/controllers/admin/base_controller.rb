# -*- encoding : utf-8 -*-
class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authenticate
  before_filter :find_notifications

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  protected
  def render_error status, exception
    #Error.create(caller: "Administrator-#{session[:user][:id]}", name: exception.class.to_s, message: exception.message, backtrace: "<p>#{exception.backtrace.try(:join, '</p><p>')}</p>")
    render template: "errors/error_#{status}", status: status
  end
  
  def authenticate
    if session[:user].blank?
      redirect_to admin_signin_path
    else
      
    end
  end
  
  def find_notifications
    @unread_notifications_count = Notification.by_user(session[:user][:id]).unread.count
    @unread_notifications_count = '99+' if @unread_notifications_count > 99
    @dropdown_notifications = Notification.by_user(session[:user][:id]).unread.sorted.limit(5)
  end

  def convert_picker_string_to_time time
    "#{time}".to_datetime - 8.hours
  end

  def convert_picker_to_datetime date, time
    "#{date} #{time}".to_datetime - 8.hours
  end
end
