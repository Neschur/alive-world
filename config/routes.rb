require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get 'world/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :world, only: [:index, :show]
end
