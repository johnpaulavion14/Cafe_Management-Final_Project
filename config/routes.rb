Rails.application.routes.draw do
  get 'products/edit_all_products' , as:'edit_all_products'
  resources :products
  devise_for :users
  get 'dashboard/all_orders' , as:'all_orders'
  get 'dashboard/order_receipt' , as:'order_receipt'
  get 'dashboard/checkout' , as:'checkout'
  get 'dashboard/sold_products' , as:'sold_products'
  get 'dashboard/print_summary' , as:'print_summary'
  post 'dashboard/create_order' 
  delete 'dashboard/delete_order' , as: 'delete_order'
  
  get 'shop_details/shop' , as:'shop'
  post 'shop_details/create_details' , as:'create_details'

  root 'home#index'

end