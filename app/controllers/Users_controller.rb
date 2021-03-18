class UsersController < ApplicationController
  before_action :find_company, only: [:new, :create]

  def create
    user = user_params
    user[:email] = user[:email].downcase
    User.create!(user)
    flash[:success] = "New user created successfully."
    redirect_to company_path(@company)
  end

  private
  def user_params
    params.permit(:email, :password, :first_name, :last_name, :company_id)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
