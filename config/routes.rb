Rails.application.routes.draw do
  get 'world/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :world, only: [:index]
end
