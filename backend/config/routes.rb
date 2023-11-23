Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  devise_for :users
  devise_for :user_profiles, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end
