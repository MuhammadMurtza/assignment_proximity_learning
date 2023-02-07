Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :new, :create, :update] do
    resources :employments, shallow: true
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
