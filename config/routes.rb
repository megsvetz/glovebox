Rails.application.routes.draw do
  
  get 'gas/index'

  devise_for :users
  root "welcomes#home"
  resources :vehicles do
    resources :repairs
    resources :insurances
    resources :registrations
    resources :oilchanges, controller: 'repairs', type: 'Oilchange'
    resources :tirerotations, controller: 'repairs', type: 'Tirerotation'
    resources :inspections, controller: 'repairs', type: 'Inspection'
    resources :alignments, controller: 'repairs', type: 'Alignment'
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