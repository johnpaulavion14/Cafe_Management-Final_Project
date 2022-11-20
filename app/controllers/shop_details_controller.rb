class ShopDetailsController < ApplicationController
    before_action :authenticate_user!

    def shop
        if current_user.shop_details.count != 0 
            redirect_to products_path    
        end
    end

    def create_details
      @shop = current_user.shop_details.new(shop_params)

      respond_to do |format|
        if @shop.save
        else
          format.html { redirect_to shop_path(shop_params), notice: @shop.errors }
        end
      end
    end

    private
    def shop_params
      params.permit(:shop_name, :shop_location, :shop_number)
    end
end
