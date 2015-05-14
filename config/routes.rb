Rails.application.routes.draw do
  devise_for :admins
  get '/posts/search', to: 'posts#search'
  get '/posts/search_form', to: 'posts#search_form'
  resources :posts do
  end
  root to: 'static_pages#about'
end
