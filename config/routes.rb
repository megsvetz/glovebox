Rails.application.routes.draw do

  get 'mechanics' => 'mechanics#index'

  get '/gas' => 'gas#index'
  get '/gas/coords' => 'gas#get_coords'
  get '/vehicles/selling' => 'vehicles#selling'

  match '/contact', to: 'welcomes#home', via: 'get'
  post '/contact', to: 'welcomes#contact'

  devise_for :users
  root "welcomes#home"
  resources :charges
  resources :vehicles do
    resources :repairs
    resources :insurances
    resources :registrations
    resources :oilchanges, controller: 'repairs', type: 'Oilchange'
    resources :tirerotations, controller: 'repairs', type: 'Tirerotation'
    resources :inspections, controller: 'repairs', type: 'Inspection'
    resources :alignments, controller: 'repairs', type: 'Alignment'
    resources :modifications, controller: 'repairs', type: 'Modification'
    resources :otherrepairs, controller: 'repairs', type: 'Otherrepair'
  end

  resources :cars, controller: 'vehicles', type: 'Car'
  resources :trucks, controller: 'vehicles', type: 'Truck'
  resources :boats, controller: 'vehicles', type: 'Boat'
  resources :trailers, controller: 'vehicles', type: 'Trailer'
  resources :atvs, controller: 'vehicles', type: 'Atv'
  resources :motorcycles, controller: 'vehicles', type: 'Motorcycle'
  resources :waverunners, controller: 'vehicles', type: 'Waverunner'
  resources :dunebuggies, controller: 'vehicles', type: 'Dunebuggy'
  resources :other, controller: 'vehicles', type: 'Other'
end
