Rails.application.routes.draw do
  
  # Devise automatically updated "routes.rb" with this "devised routing list" for users
  devise_for :users

  # Root path "/" redirecting to "index" method of the "events" controller
  # showing the list of all events
  root to: 'events#index'
  
  # Automated creation of all roads linked to major objects of the application
  # TO DO: see if some routes / methods couls nos be suppressed using "only" option
  resources :attendances, :events, :users

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
