require 'sidekiq/web'
Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
}, skip: [:sessions, :password] 
  root :to => 'ticket_desks#index'

  mount Sidekiq::Web => '/sidekiq'  

  #resources :ticket_desks do

	 # resources :cinema_halls do
     # resources :movies do
      #  resources :genre
       # resources :ticket
      #end
	  #end
#end
resources :ticket_desks do
  resources :cinema_halls do
    resources :movies do

      resources :ticket, only: %i[index]
      resources :genre 
    end
  end
end
scope 'ticket' do
  post "ticket", to: 'ticket#create', as: 'ticket_create'
  post "ticket", to: 'ticket#bookin', as: 'ticket_bookin'

end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
