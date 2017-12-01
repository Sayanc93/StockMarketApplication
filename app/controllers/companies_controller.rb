class CompaniesController < ApplicationController
  def index
    redirect_to :dashboards if current_user.portfolios.present?
  end
end
