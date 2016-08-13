Rails.application.routes.draw do
  root to: 'users#new'
  get '/home'     => 'users#new'
  get '/timeline' => 'posts#index'
  get '/friends'  => 'static_pages#friends'
  get '/about'    => 'users#show'
  get '/photos'   => 'static_pages#photos'
  get '/about_edit' => 'users#edit'

  get '/users/:user_id/timeline' => 'posts#index', as: '/user_timeline'
  get '/users/:user_id/about'    => 'users#show', as: '/user_about'
  # get '/users/:user_id/photos'    => 'users#show', as: '/user_about'
  # get '/users/:user_id/friends'    => 'users#show', as: '/user_about'
  get '/users/:user_id/about_edit'    => 'users#edit', as: '/user_about_edit'

  resources :users
  resources :posts, only: [:index, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
end

# want to be able to say /morganmartin/timeline and
# it give me morgan martin's timeline
# want to be able to visit that route as morgan and create
# a new post.