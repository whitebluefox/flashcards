Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', as: 'home'

  resources :cards 
end



# Rails.application.routes.draw do
  # get 'welcome/index'  надо ли удалять???

  # resources :articles do
    # resources :comments
  # end
  #root 'welcome#index' не понятно как нужно оставить, пункт 6.3
# end