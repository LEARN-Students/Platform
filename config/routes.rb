Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }
  root to: "pages#index"
  get '/auth/:provider/callback', to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
