# == Route Map
#
#      Prefix Verb  URI Pattern               Controller#Action
#    bloggers POST  /bloggers(.:format)       bloggers#create
# new_blogger GET   /bloggers/new(.:format)   bloggers#new
#     blogger GET   /bloggers/:id(.:format)   bloggers#show
#             GET   /bloggers/:id(.:format)   bloggers#show
#       posts POST  /posts(.:format)          posts#create
#    new_post GET   /posts/new(.:format)      posts#new
#   edit_post GET   /posts/:id/edit(.:format) posts#edit
#        post GET   /posts/:id(.:format)      posts#show
#             PATCH /posts/:id(.:format)      posts#update
#             PUT   /posts/:id(.:format)      posts#update

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers, only: [:new, :show, :create]
  
  resources :bloggers, only: [:show]
  
  resources :posts, only: [:new, :show, :create, :update, :edit]
  
end
