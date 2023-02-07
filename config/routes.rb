Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :new, :create, :update] do
    resources :employments, shallow: true
  end

  root "users#index"
end
