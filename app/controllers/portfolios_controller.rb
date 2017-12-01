class PortfoliosController < ApplicationController
  def index
  end

  def create
    companies = Company.where(security_id: company_params)
    if companies
      CompanyDataHandlingService.create_associated_company_portfolio(user: current_user, companies: companies)
      render action: "index"
    else
      redirect_to companies_path
    end
  end

  def save_details
    company_details = company_params
    companies = Company.where(name: company_details.keys)
    CompanyDataHandlingService.update_company_stock_user_details(user: current_user, company_details: company_details, companies: companies)
    redirect_to :dashboards
  end

  private

    def company_params
      params.require(:stock_company)
    end
end
