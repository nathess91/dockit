Rails.application.routes.draw do

  # devise_for :users
  #
  # devise_scope :user do
  #   authenticated :user do
  #     root 'tasks#index', as: :authenticated_root
  #   end
  #
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tasks, :assignment_notes

  get '/home' => "tasks#index"

end
