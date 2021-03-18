class UsersController < ApplicationController
  before_action :find_company, only: [:new, :create]

  def create
    redirect_to company_path(@company)
  end

  private
  def find_company
    @company = Company.find(params[:company_id])
  end
end
