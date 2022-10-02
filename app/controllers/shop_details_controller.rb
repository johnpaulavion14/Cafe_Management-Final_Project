class ShopDetailsController < ApplicationController
    before_action :authenticate_user!

    def shop_name
        if current_user.shop_details.count != 0 
            redirect_to products_path    
        end
        
    end
  
    def shop_location
    end
  
    def shop_number
    end
  
    def create_details

      case params[:detail]
        when "shop_name" 
          if params[:shop_name].count("a-zA-Z") > 0
            redirect_to shop_location_path({name:params[:shop_name]})
          else
            respond_to do |format|
              format.html { redirect_to shop_name_path, notice: "Field is blank!" }
            end            
          end
        when "shop_location"
          if params[:shop_location].count("a-zA-Z") > 0
            redirect_to shop_number_path({location:params[:shop_location],name:params[:name]})
          else
            respond_to do |format|
              format.html { redirect_to shop_location_path({name:params[:name]}), notice: "Field is blank!" }
            end
          end
        when "shop_number"
          if params[:shop_number] !~ /\D/ 
            current_user.shop_details.create(shop_name:params[:name],shop_location:params[:location],shop_number: params[:shop_number].to_s)
            redirect_to products_path 
          else
            respond_to do |format|
              format.html { redirect_to shop_number_path({location:params[:location],name:params[:name]}), notice: "Enter a valid number" }
            end
          end
      end
    end

end
