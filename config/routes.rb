Rails.application.routes.draw do
  # posts
  get 'post/create'
  get 'post_blog', to: 'post#create'
  post 'post_blog', to: 'post#new'
  get 'post/:id', to: 'post#getpost', as: 'post_item'

  # auth
  get 'register', to: 'authentication#register'
  post 'register', to: 'authentication#create'
  get 'login', to: 'authentication#login_page'
  post 'login', to: 'authentication#login'
  delete 'logout', to: 'authentication#logout'

  # user
  get 'dashboard', to: 'user#dashboard'

  root 'home#index'
end
