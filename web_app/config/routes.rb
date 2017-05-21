Rails.application.routes.draw do
  resources :transactions, only: [:create, :update] do
    collection do
      post :sent
      post :confirm
    end
  end
  root 'pages#main'
  resources :contracts

  post ':client_id/assign/:order_item_id' => 'order_items#assign', as: :assing_order_item

  get 'reset' => 'dev#reset'
  get 'mobile/:username' => 'mobile#show', as: :show_mobile
  post 'mobile/pay/:id' => 'mobile#pay', as: :pay_mobile

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'status' => 'status#check'
      post 'create_contract' => 'alexa_integration#create_contract'
      post 'split_the_bill' => 'alexa_integration#split_the_bill'
      post 'match_product' => 'alexa_integration#match_product'
      post 'ping_phones' => 'alexa_integration#ping_phones'

      match '*path', to: 'base#routing_error', via: :all
    end
  end

end
