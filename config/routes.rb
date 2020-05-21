Rails.application.routes.draw do
  root "questions#index"
  devise_for :users
  resources :questions do
    resources :answers, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :categories

end
