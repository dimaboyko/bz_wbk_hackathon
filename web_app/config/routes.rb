Rails.application.routes.draw do
  resources :transactions, only: [:create, :update]
  root 'pages#main'
  resources :contracts

  post ':client_name/assign/:order_item_name' => 'order_items#assign', as: :assing_order_item

  get 'reset' => 'dev#reset'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'status' => 'status#check'
      post 'create_contract' => 'alexa_integration#create_contract'
      post 'split_the_bill' => 'alexa_integration#split_the_bill'
      post 'match_product' => 'alexa_integration#match_product'

      match '*path', to: 'base#routing_error', via: :all
    end
  end

end
