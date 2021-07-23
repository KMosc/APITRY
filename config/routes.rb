require 'sidekiq/web'
Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
   use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  resources :users, only: %i[create]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }, skip: [:sessions, :password] 
  root :to => 'ticket_desks#index'
  resources :ticket
  
  mount Sidekiq::Web => "/sidekiq"

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
