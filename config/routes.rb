Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:new, :show, :index, :create, :edit, :update]
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy]
  namespace :admins do
  resources :books
  resources :users
  end
end
