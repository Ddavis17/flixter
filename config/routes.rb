Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  get 'privacy', to: 'static_pages#privacy'
  get 'careers', to: 'static_pages#careers'
  get 'team', to: 'static_pages#team'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :courses, only: [:index, :show]
  resources :lessons, only: [:show]
  namespace :instructor do
     resources :lessons, only: [:update]
     resources :sections, only: [] do
     resources :lessons, only: [:new, :create]
    end
    resources :sections, only: [:update]
    resources :courses, only: [:new, :create, :show] do
    end
  end
end
