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
    patch 'order_histories/:id/product' => 'order_histories#update_product', as: 'update_product'
  	resources :order_histories
  end


  devise_for :end_users, controllers: {
    sessions: "end_users/sessions",
    registrations: "end_users/registrations",
    passwords: "end_users/passwords",
  }
  # 顧客側/商品
   namespace :end_users do
    get 'items/search'
    resources :items
   end
   # エンドユーザー側のトップ画面
   get '/' => 'end_users/items#top', as: 'root'

   # 顧客側/カート
   namespace :end_users do
    get 'carts/destroy_all'
    resources :carts
   end

   # 顧客側/注文関連
   namespace :end_users do
    get 'orders/complete'
    get 'orders/history'
    get "orders/confirm" => 'orders#index'
    get 'orders/:id/history_show' => 'orders#history_show', as: 'orders_history_show'
   	resources :orders, only: [:new, :index, :create]
	    post 'orders/confirm'
	    end
	# 顧客側/ユーザー関連
   namespace :end_users do
   	resources :users
	    get 'users/:id/leave' => 'users#leave', as: 'users_leave'
   end
   # 顧客側/配送先
   namespace :end_users do
    resources :deliveries
   end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
