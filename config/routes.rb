Rails.application.routes.draw do
  
  get '/' => 'tickets#index'
  get '/error' => 'tickets#error'
  get '/page/:page' => 'tickets#index'
  get '/ticket/:id' => 'tickets#show'

end
