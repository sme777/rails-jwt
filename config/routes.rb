Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/' => redirect('/login')
  post '/signup' => 'users#create'
  post '/login' => 'users#login'
  get '/users' => 'users#index'
  put '/users' => 'users#update'
end
