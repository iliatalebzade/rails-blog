Rails.application.routes.draw do
  # errors
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'

  # root
  root 'home#index'

  # about
  get '/about', to: 'about#index'

  # posts
  get 'post_blog', to: 'post#create'
  post 'post_blog', to: 'post#new'
  get 'post/:id', to: 'post#getpost', as: 'post_item'
  get 'edit_post/:id', to: 'post#edit', as: 'edit_post'
  put 'edit_post/:id', to: 'post#update', as: 'update_post'
  # comment
  post 'post/:id/comments', to: 'comments#create', as: 'post_comments'
  delete 'post/:id/delete_comment', to: 'comments#delete', as: 'delete_comment'

  # auth
  get 'register', to: 'authentication#register'
  post 'register', to: 'authentication#create'
  get 'login', to: 'authentication#login_page'
  post 'login', to: 'authentication#login'
  delete 'logout', to: 'authentication#logout'

  # user
  get 'dashboard', to: 'user#dashboard'
  get 'user/:id', to: 'user#show_user_or_dashboard', as: 'show_user'
  get 'unauthorized', to: 'user#unauthorized'
end
