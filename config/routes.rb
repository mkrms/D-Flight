Rails.application.routes.draw do
  get 'z_rounds/edit'
  resources :countups do
    resources :rounds
  end

  resources :zeroones do
    resources :z_rounds
  end

  devise_for :users
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
   