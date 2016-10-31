Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  get '/' 									 => 'welcome#index'
  get 'welcome/index', as: 'user_root'
  get '/users'           		 => 'welcome#all'
  get 'users/profile' 			 => 'welcome#profile'
  get '/users/profile/:id'   => 'welcome#show'


	get '/posts'               => 'posts#index', as: 'posts'
	post '/posts'              => 'posts#new',   as: 'new_post'
  get '/posts/:id'           => 'posts#show'  
  get '/posts/update/:id'    => 'posts#edit',  as: 'edit_post'
  put '/posts/update/:id'    => 'posts#update'
  patch '/posts/update/:id'  => 'posts#update'
  delete '/posts/update/:id' => 'posts#delete'



  get '/comments/:id'        => 'comments#index'
  get '/comments/new/:id'    => 'comments#new'
  post '/comments/new/:id'   => 'comments#create'
  get 'comments/user/:id'    => 'comments#show'

  resources :comments
end
