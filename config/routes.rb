Rails.application.routes.draw do
  get 'favourites/update'
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
  post 'add_agency_event', to: 'home#add_agency_event'
  get 'delete_agency_tour', to: 'home#delete_agency_tour'
  get 'edit_agency_event/:id', to: 'home#edit_agency_event' ,as: 'edit_event'
  patch 'save_edit_agency_changes', to: 'home#save_edit_agency_changes' ,as: 'update_event'
  post 'add_comment', to: 'home#add_comment'
  get 'del_comment', to: 'home#del_comment'
  post 'filter', to:'home#filters'
  get 'filter', to:'home#groupTours'

  #-------------------------------------------------------------------------------------

  get 'user_profile', to: 'user#user_profile'
  get 'customizedTours', to: 'user#customizedTours'
  get 'user_single_tour', to: 'user#user_single_tour'
  get 'all_user_tours', to: 'user#all_user_tours'
  get 'edit_user_profile', to: 'user#edit_user_profile'
  get 'edit_user_info', to: 'user#edit_user_info'
  get 'edit_user_password', to: 'user#edit_user_password'
  get 'user_new_event', to: 'user#user_new_event'
  get 'add_user_event', to: 'user#add_user_event'
  get 'delete_user_tour', to: 'user#delete_user_tour'
  get 'edit_user_event', to: 'user#edit_user_event'
  get 'save_edit_user_changes', to: 'user#save_edit_user_changes'
  post 'add_user_comment', to: 'user#add_user_comment'
  get 'del_user_comment', to: 'user#del_user_comment'
  get 'user_fav_tour', to:'favourites#view_all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
