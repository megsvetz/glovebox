Rails.application.routes.draw do
  devise_for :users
  root "welcome#home"
  resources :vehicles do
    resources :repairs
  end
  resources :cars, controller: 'vehicles', type: 'Car'
  resources :trucks, controller: 'vehicles', type: 'Truck'
  resources :boats, controller: 'vehicles', type: 'Boat'
  resources :trailers, controller: 'vehicles', type: 'Trailer'
  resources :atvs, controller: 'vehicles', type: 'Atv'
  resources :motorcycles, controller: 'vehicles', type: 'Motorcycle'
  resources :waverunners, controller: 'vehicles', type: 'Waverunner'
  resources :dunebuggies, controller: 'vehicles', type: 'Dunebuggy'
  resources :oilchanges, controller: 'repairs', type: 'Oilchange'
  resources :tirerotations, controller: 'repairs', type: 'Tirerotation'
  resources :inspections, controller: 'repairs', type: 'Inspection'
  resources :alignments, controller: 'repairs', type: 'Alignment'
  resources :insurances
  resources :registrations
end
