class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        shop_name_path

        # detail = current_user.shop_details.first

        # if detail.shop_name == nil || detail.shop_location == nil || detail.business_type == nil 
        #     shop_name_path
        # else
        #     dashboard_index_path    
        # end

    end



end
