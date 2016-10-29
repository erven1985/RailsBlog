Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  get '/' 									 => 'welcome#index'
  get 'welcome/index', as: 'user_root'
  get '/users'           		 => 'welcome#all'
  get 'users/profile' 			 => 'welcome#profile'
  get 'users/update'				 => 'welcome#update'
  get '/users/profile/:id'   => 'welcome#show'


	get '/posts'           => 'posts#show'
	post '/posts'          => 'posts#new'

end
