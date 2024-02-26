Rails.application.routes.draw do
  devise_for :users
  # Add a custom route for logout
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end
  root 'events#index'
  post 'events/create_event_a', to: 'events#create_event_a'
  post 'events/create_event_b', to: 'events#create_event_b'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
