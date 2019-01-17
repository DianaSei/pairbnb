Rails.application.routes.draw do
  get 'braintree/new'
  root 'welcome#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :listings do
    resources :bookings
  end



  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users do
    resources :bookings, only: [:index, :show]
  end


  post "/listings/:id/verify" => "listings#verify", as: "verify"
  post "/listings/:id/unverify" => "listings#unverify", as: "unverify"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # A URL that redirects user from google to your app
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post 'braintree/checkout'

end
