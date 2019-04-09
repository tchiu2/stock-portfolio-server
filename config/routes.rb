Rails.application.routes.draw do
  resources :users, defaults: { format: 'json' }, only: [:show] do
    get '/portfolio', to: 'users#portfolio'
    get '/transactions', to: 'transactions#index'
  end
  resources :stocks, defaults: { format: 'json' }, only: [:index]
  resources :transactions, defaults: { format: 'json' }, only: [:create]

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
end
