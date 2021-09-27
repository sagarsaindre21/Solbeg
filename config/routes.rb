Rails.application.routes.draw do
  	root to: 'home#index'

	devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

	resources :users, only: [:index] do
	  resources :profiles, only: [:show, :edit, :update]
	end

	# no routes and more
	match "*path", "/", to: "restricts#routes_not_exists", via: :all
end
