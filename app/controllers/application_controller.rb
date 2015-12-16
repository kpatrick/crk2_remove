class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :check_authentication
  before_filter :set_user

  def set_locale
    session["locale"] = params["locale"] if params["locale"] && ["en", "es"].include?(params["locale"])
    I18n.locale = session["locale"] if session["locale"] && ["en", "es"].include?(session["locale"])
  end

  def check_authentication
    if session[:username].blank?
      redirect_to controller: "welcome", action: "login", method: "get"
    end
  end

  def set_user
    if session[:username].present?
      @user = User.where(username: session[:username]).first
    end
  end
end
