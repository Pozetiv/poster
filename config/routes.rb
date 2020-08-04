Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :subscribes, except: %i[new edit update]

  resources :communities do
    member do
      get :subscribes
      put :approve
    end
  end
end
