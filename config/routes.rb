# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_for :users
  devise_for :users, path: 'auth',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       password: 'secret',
                       confirmation: 'verification',
                       unlock: 'unblock',
                       registration: 'register',
                       sign_up: 'cmon_let_me_in'
                     }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'homes#index'
  get 'homes/index'
end
