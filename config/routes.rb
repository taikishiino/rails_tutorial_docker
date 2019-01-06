Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about"
  get "signup" => "users#user_create"
  get "login" => "users#login_form"
  post "login" => "users#login"

  get "posts" => "posts#index"
  get "posts/new" => "posts#post_create"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#post_detail"
  get "posts/:id/edit" => "posts#post_edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "users" => "users#index"
  get "users/:id" => "users#user_detail"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#user_edit"
  post "users/:id/update" => "users#update"

end
