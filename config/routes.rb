Rails.application.routes.draw do
  devise_for :admins
  get '/posts/search', to: 'posts#search'
  resources :posts do
  end
  root to: 'static_pages#about'
end
