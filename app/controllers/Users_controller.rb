class UsersController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @user = User.new(company: @company)
  end
end
