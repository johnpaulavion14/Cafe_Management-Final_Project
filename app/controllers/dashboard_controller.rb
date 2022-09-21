class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def shop_name
  end

  def shop_location
  end

  def business_type
  end

  def create_details

  end
end


def create
    
  if current_user.transactions.create(transaction_params)
    redirect_to trader_dashboard_portfolio_path
  else
    render :transaction_type
  end
end