Rails.application.routes.draw do
  root :to => 'ticket_desks#index'

  resources :ticket_desks do
	  resources :cinema_halls do
  		resources :ticket do

      end
	end
end

scope 'ticket' do
  post 'ticket', to: 'ticket#buy', as: 'ticket_buy'
  post 'ticket', to: 'ticket#revervation', as: 'ticket_reservation'
end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html