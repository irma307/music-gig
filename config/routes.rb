Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [ :show, :index ]
  resources :artists do
    resources :events, except: [ :index, :update, :create ] do
      resources :reviews, only: [ :new, :create, :destroy ]
    end
  end
end
