class UsersController < ApplicationController
  before_action :find_company, only: [:new, :create]

  def show
    @user = User.find(session[:user]["id"])
    if @user.id == params[:id]
    else
      flash.now[:error] = "you must be logged in to vew this page"
      render :login_form
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
      session[:user] = @user
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

  def find_company
    @company = Company.find(params[:company_id])
  end
end
