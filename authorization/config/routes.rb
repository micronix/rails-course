Rails.application.routes.draw do
  devise_for :users
  get '/protected' => 'protected#index'
  root 'home#index'
end
