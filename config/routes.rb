Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :categories do
    resources :products
  end
end
