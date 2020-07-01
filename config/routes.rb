

Rails.application.routes.draw do
  root to: 'destinations#home'
  
  resources :bloggers
  resources :destinations, only: [:show, :index]
  resources :posts, only: [:new, :show, :create, :update, :edit]
  resources :posts do
    member do
      get :add_like
    end
  end
  
end
