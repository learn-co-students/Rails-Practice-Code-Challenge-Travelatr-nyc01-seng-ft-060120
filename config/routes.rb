# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
#     bloggers GET    /bloggers(.:format)          bloggers#index
#              POST   /bloggers(.:format)          bloggers#create
#  new_blogger GET    /bloggers/new(.:format)      bloggers#new
# edit_blogger GET    /bloggers/:id/edit(.:format) bloggers#edit
#      blogger GET    /bloggers/:id(.:format)      bloggers#show
#              PATCH  /bloggers/:id(.:format)      bloggers#update
#              PUT    /bloggers/:id(.:format)      bloggers#update
#              DELETE /bloggers/:id(.:format)      bloggers#destroy
# destinations GET    /destinations(.:format)      destinations#index
#  destination GET    /destinations/:id(.:format)  destinations#show
#        posts POST   /posts(.:format)             posts#create
#     new_post GET    /posts/new(.:format)         posts#new
#    edit_post GET    /posts/:id/edit(.:format)    posts#edit
#         post GET    /posts/:id(.:format)         posts#show
#              PATCH  /posts/:id(.:format)         posts#update
#              PUT    /posts/:id(.:format)         posts#update
#         root GET    /                            destinations#index

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers
  
  resources :destinations, only: [:show, :index]
  
  resources :posts, only: [:new, :show, :create, :update, :edit]


  root 'destinations#index'
  
end
