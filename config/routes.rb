Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'
  get 'dashboard/shop_name' , as:'shop_name'
  get 'dashboard/shop_location' , as:'shop_location'
  get 'dashboard/business_type' , as:'business_type'
  post 'dashboard/create_details' , as:'create_details'
  
  root 'home#index'

end