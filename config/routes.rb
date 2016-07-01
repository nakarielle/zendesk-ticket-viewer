Rails.application.routes.draw do
  
  get '/' => 'tickets#index'

  get '/tickets/:id' => 'tickets#show'
end
