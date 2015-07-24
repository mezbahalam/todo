Rails.application.routes.draw do

  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  resources :users
  resources :user_sessions, only: [:new, :create ]
  resources :password_resets, only: [:new, :create, :edit]

  root "todo_lists#index"
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

end
