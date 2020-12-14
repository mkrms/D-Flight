Rails.application.routes.draw do
  resources :countups do
    resources :rounds, only:[:create]
  end

  devise_for :users
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
   