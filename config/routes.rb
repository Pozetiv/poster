Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get :up_vote
      get :down_vote
    end

    resources :comments, except: :show
  end

  root "posts#index"

  resources :subscribes, except: %i[new edit update]

  resources :communities do
    member do
      get :subscribes
      put :approve
    end
  end

  resources :comments do
    resources :comments, except: [:show]
  end
end
