Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/search', to: 'chatgpt#suggest'
  get '/auth/:provider/callback', to: 'sessions#create'

end
