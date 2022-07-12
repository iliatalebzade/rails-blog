Rails.application.routes.draw do
  get 'post/create'
  
  get 'post_blog', to: "post#create"
  post 'create_blog_post', to: "post#new"
  
  get "post/:id", to: "post#getpost", as: "post_item"

  root "home#index"
end
