Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:new, :show, :index, :create, :edit, :update]
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy]
end
