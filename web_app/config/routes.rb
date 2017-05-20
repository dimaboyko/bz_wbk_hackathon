Rails.application.routes.draw do
  resources :transactions, only: [:create, :update]
  root 'pages#main'
  resources :contracts

  post ':client_id/assign/:order_item_id' => 'order_items#assign', as: :assing_order_item

  get 'reset' => 'dev#reset'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'status' => 'status#check'

      match '*path', to: 'base#routing_error', via: :all
    end
  end

end
