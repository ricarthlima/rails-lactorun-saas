Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#index'
  
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
  get 'termos' => 'pages#terms'
  get 'privacidade' => 'pages#privacy'
end
