class CompanyDataHandlingService
  def self.create_associated_company_portfolio(user:, companies: [])
    companies.each do |company|
      user.portfolios.where(company_id: company.id).first_or_create!
    end
    PortfolioUpdaterJob.perform_now(user.id)
  end

  def self.update_company_stock_user_details(user:, company_details:, companies: [])
    companies.each do |company|
      portfolio = user.portfolios.find_by(company_id: company.id)
      portfolio.update_attributes(buying_stock_price: company_details[company.name][0],
                                  number: company_details[company.name][1])
    end
  end
end
