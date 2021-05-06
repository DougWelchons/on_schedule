class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :belongs_to_company?, :current_company

  def require_login
    unless current_user && belongs_to_company?
      flash[:error] = 'You must be logged in to view this page'
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_company
    @current_company ||= Company.find(session[:company_id]) if session[:company_id]
  end

  def belongs_to_company?
    current_user.company_id == params[:company_id].to_i
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
