Rails.application.routes.draw do
  resources :likes
  resources :answers
  resources :questions
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
