Rails.application.routes.draw do
  devise_for :admins
  get '/posts/search', to: 'posts#search'
  get '/posts/search_form', to: 'posts#search_form'
  post '/posts/upload', to: 'posts#upload'
  resources :posts
  resources :contacts
  get '/about', to: 'static_pages#about'
  root to: 'posts#index'
end
