WeLoveHeroku::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentications' }, skip: [:sessions]
  devise_scope :user do
    delete '/sessions' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated :user do
    root 'pages#index', as: :authenticated_user_root
  end
  root to: 'pages#index'
end
