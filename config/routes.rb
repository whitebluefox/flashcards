Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as: 'home'

  post 'check_card', to: 'cards#check_card'

  resources :cards
end
