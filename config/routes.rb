Rails.application.routes.draw do
  resources :simulations, only: [:index, :show, :create, :new, :destroy]
end
