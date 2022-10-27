Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'products/edit_all_products' , as:'edit_all_products'
  resources :products
  
  get 'orders/all_orders' , as:'all_orders'
  get 'orders/order_receipt' , as:'order_receipt'
  get 'orders/checkout' , as:'checkout'
  get 'orders/sold_products' , as:'sold_products'
  get 'orders/print_summary' , as:'print_summary'
  post 'orders/create_order' 
  delete 'orders/delete_order' , as: 'delete_order'
  
  get 'shop_details/shop' , as:'shop'
  post 'shop_details/create_details' , as:'create_details'

  root 'home#index'

end