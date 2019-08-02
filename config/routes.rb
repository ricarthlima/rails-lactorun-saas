Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
  get 'terms' => 'pages#terms'
  get 'privacy' => 'pages#privacy'
end
