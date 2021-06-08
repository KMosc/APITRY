require 'sidekiq/web'
Rails.application.routes.draw do
  #use_doorkeeper do
  #  skip_controllers :authorizations, :applications, :authorized_applications
  #end
  resources :users, only: %i[create]
  #devise_for :users, controllers: {
  #  registrations: 'users/registrations',
#}, skip: [:sessions, :password] 
  root :to => 'ticket_desks#index'

  mount Sidekiq::Web => '/sidekiq'  

  #resources :ticket_desks do
  resources :movies, only: %i[index]

  resources :cinema_halls do
    resources :movies
  end
  resources :genre 
  resources :ticket_desks
  resources :movies do

    resources :ticket, only: %i[create]
    resources :ticket, only: %i[index]

    resources :genre 
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
