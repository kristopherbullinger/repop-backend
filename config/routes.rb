Rails.application.routes.draw do
  resources :purchases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :items, :users, :reviews, :likes, :relationships
      post '/login', to: "auth#create"
      post '/relationships/toggle', to: "relationships#toggle"
      post '/likes/toggle', to: "likes#toggle"
    end
  end
end
