class UsersController < ApplicationController
  before_action :find_company, only: [:new, :create, :show]

  def show
    # require "pry"; binding.pry
    unless current_user && belongs_to_company?
      flash[:error] = "you must be logged in to vew this page"
      redirect_to login_path
    end
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    User.create!(user)
    flash[:success] = "New user created successfully."
    redirect_to company_path(@company)
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(company_user_path(@user.company, @user))
    else
      flash.now[:error] = "Invalid Email or Password"
      render :login_form
    end
  end

  private
  def user_params
    params.permit(:email, :password, :first_name, :last_name, :company_id)
  end
end
