Rails.application.routes.draw do

  root to: "users/sessions#new", as: "/login"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
