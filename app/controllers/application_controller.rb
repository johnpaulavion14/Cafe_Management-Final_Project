class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        shop_name_path
    end

end
