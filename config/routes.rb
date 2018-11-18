Rails.application.routes.draw do
  get '/about' => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/top" => "home#top"
end
