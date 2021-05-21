Rails.application.routes.draw do
  root :to => 'ticket_desks#index'

  resources :ticket_desks do
	  resources :cinema_halls do
  		resources :ticket do
      match 'ticket' => 'ticket#buy', :via => [:get]
      end
	end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
