Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  get '/contestants', to: 'contestants#index'

  get '/projects/:id/contestants/new', to: 'contestants#new'
  post '/projects/:id/contestants', to: 'contestants#create'
end
