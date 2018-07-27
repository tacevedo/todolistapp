Rails.application.routes.draw do
  get 'user_tasks/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :tasks do
    resources :user_tasks
  end

  root to: 'tasks#index'
end
