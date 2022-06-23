Rails.application.routes.draw do
  
    get '/', to: 'jobs#index'

    get '/jobs/:id', to: 'jobs#show'

    post '/jobs', to: 'jobs#create'
end
