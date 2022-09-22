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

    case params[:detail]
      when "shop_name" 
        if ShopDetail.create(shop_name: params[:shop_name])
          redirect_to shop_location_path
        else
          render :shop_name
        end
      when "shop_location"
        shop_detail = ShopDetail.first
        if shop_detail.update(shop_location: params[:shop_location])
          redirect_to business_type_path
        else
          render :shop_location
        end
      when "business_type"
        shop_detail = ShopDetail.first
        if shop_detail.update(business_type: params[:business_type])
          redirect_to dashboard_index_path
        else
          render :business_type
        end


    end
  end



end



