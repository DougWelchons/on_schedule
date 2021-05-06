class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:company_id])
  end
end
