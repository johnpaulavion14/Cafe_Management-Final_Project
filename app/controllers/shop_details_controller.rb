class ShopDetailsController < ApplicationController
    before_action :authenticate_user!

    def shop_name
        if current_user.shop_details.count != 0 
            redirect_to dashboard_index_path    
        end
        
    end
  
    def shop_location
    end
  
    def business_type
    end
  
    def create_details

      case params[:detail]
        when "shop_name" 
          if params[:shop_name].count("a-zA-Z") > 0
            redirect_to shop_location_path({name:params[:shop_name]})
          else
            render :shop_name
          end
        when "shop_location"
          if params[:shop_location].count("a-zA-Z") > 0
            redirect_to business_type_path({location:params[:shop_location],name:params[:name]})
          else
            render :shop_location
          end
        when "business_type"
          if params[:business_type].count("a-zA-Z") > 0
            current_user.shop_details.create(shop_name:params[:name],shop_location:params[:location],business_type: params[:business_type])
            redirect_to dashboard_index_path
          else
            render :business_type
          end
      end
    end

end
