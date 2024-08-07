Rails.application.routes.draw do
  root 'users#index'
  resources :posts, except: [:index]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
