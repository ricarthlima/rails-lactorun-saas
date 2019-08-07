Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#index'
  
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
  get 'termos' => 'pages#terms'
  get 'privacidade' => 'pages#privacy'
  
  get 'app' => 'app#manager_verification'
  get 'app_set' => 'app#set_manager'
  
  get 'protocol' => "app#index"
  
  post 'new_lactate_test' => "app#new_lactate_test"
end
