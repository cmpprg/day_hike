Rails.application.routes.draw do
  #trips
  get '/trips', to: 'trips#index'
  get '/trips/:id', to: 'trips#show'
  #trails
  get '/trails/:id', to: 'trails#show'
end
