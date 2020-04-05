Rails.application.routes.draw do
  # trips
  get '/trips', to: 'trips#index'
  get '/trips/:id', to: 'trips#show'
end
