Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|ru/ do
    root                     'main_pages#home'
    get     '/signup',   to: 'signup_users#new'
    get     '/login',    to: 'sessions#new'
    get     '/logout',   to: 'sessions#destroy'
    
    # TODO: Edit get '/signup' and :signup_users
    resources :signup_users,  only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :companies
    resources :users
    resources :teams do
      resources :team_users, only: [:new, :create, :destroy]
    end
      # resources :team_users, only: [:new, :create, :destroy]
      # get :new_team_user, to: 
      # get '/teams/new_team_user', to: 'teams#new_team_user', as: :new_team_user
  end
end
