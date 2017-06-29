Rails.application.routes.draw do

  devise_scope :user do
       get "signup", to: "devise/registrations#new"
       get "login", to: "devise/sessions#new"
       get "logout", to: "devise/sessions#destroy"

    authenticated :user do
      root 'tasks#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tasks, :assignment_notes, :assignments, :assignment_contacts, :assignment_companies, :posts

  get '/home' => "tasks#index"

  get '/bulletins' => "posts#index"

end
