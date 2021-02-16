Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'article#index'
  
  resources :articles, only: %i[show]
end
