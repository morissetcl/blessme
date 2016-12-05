Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pains
  resources :users, only: [:index, :show, :edit, :update]
  resources :pains do
    resources :prayers
  end

  get "/get-notif", to: "notifications#get_notif"

  resources :notifications, only: [] do
    get :read_all_notification, on: :collection
  end

end

