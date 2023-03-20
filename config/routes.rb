Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/generate', to: 'chatgpt#generate'
  post '/search', to: 'chatgpt#suggest'

end