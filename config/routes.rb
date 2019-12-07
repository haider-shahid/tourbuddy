Rails.application.routes.draw do
  devise_for :agencies,path: 'agencies', controllers: {
      sessions: 'agencies/sessions',confirmations: 'agencies/confirmations',
      registrations: 'agencies/registrations',passwords: 'agencies/passwords'
  }

  devise_for :users, :controllers =>{registrations: 'registrations'},path: 'users'
  root 'home#index'
  get 'home/about', 'home#about'
  get 'agency_profile', to: 'home#agency_profile'
  get 'groupTours', to: 'home#groupTours'
  get 'agency_single_tour', to: 'home#agency_single_tour'
  get 'all_agency_tours', to: 'home#all_agency_tours'
  get 'edit_agency_profile', to: 'home#edit_agency_profile'
  get 'edit_agency_info', to: 'home#edit_agency_info'
  get 'edit_agency_password', to: 'home#edit_agency_password'
  get 'agency_new_event', to: 'home#agency_new_event'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
