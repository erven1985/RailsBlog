Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  get '/' 									 => 'welcome#index'
  get 'welcome/index', as: 'user_root'
  get '/users'           		 => 'welcome#all'
  get 'users/profile' 			 => 'welcome#profile'
  get '/users/profile/:id'   => 'welcome#show'


	get '/posts'               => 'posts#index'
	post '/posts'              => 'posts#new'
  get '/posts/:id'           => 'posts#show' 



  get '/comments/:id'        => 'comments#index'
  get '/comments/new/:id'    => 'comments#new'
  post '/comments/new/:id'   => 'comments#new'
  get 'comments/user/:id'    => 'comments#show'

end
