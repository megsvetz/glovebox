Rails.application.routes.draw do
  devise_for :users
  root "welcome#home"
  resources :vehicles do
    resources :repairs
  end
  resources :insurances
  resources :registrations
end
