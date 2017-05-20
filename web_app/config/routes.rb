Rails.application.routes.draw do
  resources :transactions, only: [:create, :update]

  root 'pages#main'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'status' => 'status#check'

      match '*path', to: 'base#routing_error', via: :all
    end
  end

end
