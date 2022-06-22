Rails.application.routes.draw do
  
    get '/', to: 'static_pages#index'

    get '/jobs/:id', to: 'jobs#show'

    post '/jobs', to: 'jobs#create'
end
