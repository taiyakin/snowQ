Rails.application.routes.draw do
  resources :skiresorts
  root "questions#index"
  devise_for :users
  resources :users
  resources :questions do
    resources :answers, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    collection do
      get 'search'
    end
  end

  resources :categories

end
