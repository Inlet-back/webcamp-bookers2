Rails.application.routes.draw do

  resources :users, only: [ :index, :show, :edit]
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy]
  root to: 'homes#top'
  get 'homes/about', to: "homes#about", as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
