class DashboardsController < ApplicationController
  def index
    @market_data = Market.all.decorate
    @user_portfolio_data = UserPortfolioDecorator.decorate(current_user.portfolios)
    @user_company_data = current_user.portfolios.decorate
  end
end
