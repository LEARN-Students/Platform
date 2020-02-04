Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }
  get '*path', to: 'pages#index', constraints: ->(request){ request.format.html? }
  root to: "pages#index"
end
