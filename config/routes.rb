WeLoveHeroku::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentications' }, skip: [:sessions]
  devise_scope :user do
    delete '/sessions' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :sites
  resources :users, only: [:show]

  get 'signin' => 'pages#signin'
  root to: 'pages#top'
end
