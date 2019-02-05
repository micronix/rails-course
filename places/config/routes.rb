Rails.application.routes.draw do
    resources :places
    resources :users
    
    post '/users/add_place' => 'users#add_place'
    delete '/users/remove_place' => 'users#delete_place'
end
