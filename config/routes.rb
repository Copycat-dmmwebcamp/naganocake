Rails.application.routes.draw do



  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations",
    passwords: "admins/passwords",
  }
  # 管理者側/top画面
  namespace :admins do
    get 'homes/top'
  end
  # 顧客側/商品
   namespace :admins do
    resources :items
   end
  # 顧客側/ジャンル
   namespace :admins do
    resources :categories
   end
  # 顧客側/ユーザー関連
   namespace :admins do
    resources :users
   end
   # 顧客側/注文履歴
  namespace :admins do
  	resources :order_histories
  	get 'order_histories/:id/order' => 'order_histories#update_order', as: 'update_order'
  	get 'order_histories/:id/product' => 'order_histories#update_product', as: 'update_product'
  end


  devise_for :end_users, controllers: {
    sessions: "end_user/sessions",
    registrations: "end_user/registrations",
    passwords: "end_user/passwords",
  }
  # 顧客側/商品
   namespace :end_user do
    resources :items
   end

   # 顧客側/カート
   namespace :end_user do
    resources :carts
   end

   # 顧客側/注文関連
   namespace :end_user do
   	resources :orders
	    get 'orders/confirm'
	    get 'orders/history'
	    get 'orders/:id/history_show' => 'orders#history_show', as: 'orders_history_show'
   end
	# 顧客側/ユーザー関連
   namespace :end_user do
   	resources :users
	    get 'users/:id/leave' => 'users#leave', as: 'users_leave'
   end
   # 顧客側/配送先
   namespace :end_user do
    resources :deliveries
   end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
