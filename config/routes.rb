Rails.application.routes.draw do
  get "/" => "home#top"
  get "/about" => "home#about"

  get "posts" => "posts#index"
  get "posts/new" => "posts#post_create"

  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#post_detail"
end
