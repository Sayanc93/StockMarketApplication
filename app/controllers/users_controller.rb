class UsersController < ApplicationController

  def edit
    @user_companies = current_user.portfolios.map(&:company)
  end
end
