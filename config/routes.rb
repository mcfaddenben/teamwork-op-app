Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "users" => "users#create"
  get "users/:id" => "users#show"
  patch "users/:id" => "users#update"

  get "teams" => "teams#index"
  post "teams" => "teams#create"
end
