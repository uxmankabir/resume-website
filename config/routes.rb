Rails.application.routes.draw do
  resources :pages, only: [:index]
  root "pages#index"
end
