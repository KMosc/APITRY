require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'  
  root :to => 'ticket_desks#index'

  #resources :ticket_desks do

	 # resources :cinema_halls do
     # resources :movies do
      #  resources :genre
       # resources :ticket
      #end
	  #end
#end
resources :cinema_halls
resources :ticket
resources :genre do
  resources :movies
end
scope 'ticket' do
  post "ticket", to: 'ticket#create', as: 'ticket_create'
  post "ticket", to: 'ticket#bookin', as: 'ticket_bookin'

end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
