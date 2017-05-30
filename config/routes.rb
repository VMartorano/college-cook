Rails.application.routes.draw do
  root to: "home#index"
  get "/contact" => "home#contact"
  get "/about" => "home#about"

  post "/form-response" => "home#email"

  get "/recipes/try" => "recipes#try"

  get '/recipes/show/:id' => 'recipes#show'

  post '/result' => 'home#result'

  get "/result" => "home#result"

  get "/recipes/favorites" => "recipes#favorites"

  post "/save_recipe/:id" => "recipes#saver"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  # require 'sendgrid-ruby'

end
