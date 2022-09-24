Rails.application.routes.draw do
  resources :products
  devise_for :users
  get 'dashboard/index'
  get 'dashboard/order' , as:'order'

  get 'shop_details/shop_name' , as:'shop_name'
  get 'shop_details/shop_location' , as:'shop_location'
  get 'shop_details/business_type' , as:'business_type'
  post 'shop_details/create_details' , as:'create_details'
  
  root 'home#index'

end