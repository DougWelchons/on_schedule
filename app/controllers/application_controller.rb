class ApplicationController < ActionController::Base
  helper_method :current_user, :belongs_to_company?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def belongs_to_company?
    current_user.company_id == params[:company_id].to_i
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
