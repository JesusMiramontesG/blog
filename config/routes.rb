Rails.application.routes.draw do

  resources :categories
  devise_for :users
  get 'welcome/index'
  root 'articles#index'

  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end

  get '/dashboard', to: "welcome#dashboard"
  put "/articles/:id/publish", to: "articles#publish"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
