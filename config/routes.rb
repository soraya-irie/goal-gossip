Rails.application.routes.draw do
  root 'users#index'
  resources :posts, except: [:index] do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :users, only: %i[show] do
    collection do
      get 'search'
    end
  end
  get 'j_league/standings'
  get 'j_league/teams'
  get 'j_league/search'
  get 'j_league/:id', to: 'j_league#show', as: :team
end
