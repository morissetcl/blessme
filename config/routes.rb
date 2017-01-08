Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
   get '/team' => 'pages#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pains
  resources :users, only: [:show, :edit, :update]
  resources :pains do
    resources :prayers do
      resource :like, module: :prayers
    end
  	post '/upload' => 'pains#upload', on: :member
  end

  get "/get-notif", to: "notifications#get_notif"

  resources :notifications, only: [] do
    get :read_all_notification, on: :collection
  end

  resources :pains, only: [] do
    member do
      post :upvote
      post :report
    end
  end

  resources :prayers, only: [] do
    member do
      post :report_prayer
  end
end

end
