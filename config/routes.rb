Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'items/find', to: 'items_search#show'
      get 'items/find_all', to: 'items_search#index'

      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show]
      
      namespace :items do
        get '/:id/merchant', to: 'merchants#show'
      end
      namespace :merchants do
        get '/:id/items', to: 'items#show'
      end
      # resources :items, only: [:index, :show, :create, :update, :destroy]
      # resources :merchants, only: [:index, :show]
    end
  end
end
