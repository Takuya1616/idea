Rails.application.routes.draw do

  resources :parent_squares, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :child_square
  end
  root to: "homes#top"
  get "/about"=>'homes#about'
  devise_for :users, controllers: { sessions: "users/sessions",
    registrations: 'users/registrations' }
  resources :users, only:[:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
