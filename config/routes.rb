Rails.application.routes.draw do
   devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
   root to: 'pages#home'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :pains
   resources :users, only: [:index, :show, :edit, :update]
   resources :pains do
      resources :prayers, only: [:index, :show, :new, :create, :edit, :update, :destroy] 

  		post '/upload' => 'pains#upload', on: :member
   end
end

