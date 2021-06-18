require 'sidekiq/web'
Rails.application.routes.draw do
   use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  resources :users, only: %i[create]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }, skip: [:sessions, :password] 
  root :to => 'ticket_desks#index'

  mount Sidekiq::Web => "/sidekiq"
  #resources :ticket_desks do
  resources :movies, only: %i[index show] do
    resources :ticket, only: %i[index show]
  end
  resources :cinema_halls, only: %i[index show] do
    resources :movies, only: %i[index show]
    end
  end
    
  resources :movies, only: %i[index show] do
    resources ticket_desks, only: %i[index show] do
      resources :ticket, only: %i[create show]
    end
  end
  resources :genre 

  resources :payment_history

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
