Rails.application.routes.draw do
  devise_for :agencies,path: 'agencies', controllers: {
      sessions: 'agencies/sessions',confirmations: 'agencies/confirmations',
      registrations: 'agencies/registrations',passwords: 'agencies/passwords'
  }

  devise_for :users, :controllers =>{registrations: 'registrations'},path: 'users'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
