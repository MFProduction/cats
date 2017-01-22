Rails.application.routes.draw do
  devise_for :customers
  resources :funerals, only: [:index, :new, :create, :destroy]

  get 'funerals/:date' => 'funerals#day', as: "day"
  root to: "funerals#index"
end
