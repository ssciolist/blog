Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  get 'admin', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  resources :articles, only: %i[show]
end
