AdoptAThing::Application.routes.draw do
  resources :owners


  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'users',
    sessions: 'sessions',
  }
  get '/adoption', to: 'things#adoption', as: 'adoption'
  get '/address', to: 'addresses#show', as: 'address'
  get '/info_window', to:'info_window#index', as: 'info_window'
  get '/sitemap', to: 'sitemaps#index', as: 'sitemap'

  scope '/sidebar', controller: :sidebar do
    get :search, as: 'search'
    get :combo_form, as: 'combo_form'
    get :edit_profile , as: 'edit_profile'
  end

  resource :reminders
  resource :things
  match 'terms' => 'things#terms'
  match 'update_thing' => 'owners#update_thing'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'main#index'
end
