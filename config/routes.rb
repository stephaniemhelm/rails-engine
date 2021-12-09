Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'items/find', to: 'items_search#show'
      get 'items/find_all', to: 'items_search#index'

      namespace :items do
        get '/:id/merchant', to: 'merchants#show'
      end
      namespace :merchants do
        get '/:id/items', to: 'items#show'
      end
      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show]
    end
  end
end
# it "can get all items by matching name" do
#      item = create_list(:item, 3).first
#
#      get "/api/v1/items/find_all?name=#{item.name}"
#
#      items = JSON.parse(response.body)
#
#      expect(response).to be_success
#      expect(items.first["name"]).to eq(item.name)
#      expect(items.count).to eq(3)
