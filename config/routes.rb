Rails.application.routes.draw do
  
  get '/' => 'tickets#index'
  get '/page/:page' => 'tickets#index'
  get '/ticket/:id' => 'tickets#show'

end
