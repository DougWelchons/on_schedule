class UsersController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
  end
end
