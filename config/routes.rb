Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  
  # WELCOME ROUTES
  get '/' 									                => 'welcome#index', as: 'user_root'
  get '/users'           		                => 'welcome#all'
  get 'users/profile' 			                => 'welcome#profile'
  get '/users/profile/:id'                  => 'welcome#show'

  # POSTS ROUTES
	get '/posts'                              => 'posts#index', as: 'posts'
	post '/posts'                             => 'posts#new',   as: 'new_post'
  

  # NESTED POSTS ROUTES

  # edit form a specific user's specific post:
  get '/users/:id/posts/:post_id/edit'      => 'posts#edit',  as: 'edit_post'
  
  # sending edit data 
  patch '/users/:post_id/posts'             => 'posts#update', as: 'update_post' 
  put '/users/:post_id/posts'               => 'posts#update' 


  # see all specific user's posts
  get '/users/:id/posts'                    => 'posts#show', as: 'post'  
  
  # delete specific user's specific post
  delete '/users/:post_id/posts'            => 'posts#destroy', as: 'destroy_post'

  

  # COMMENTS ROUTES
  get '/comments/:id'                       => 'comments#index'
  get '/comments/new/:id'                   => 'comments#new', as: "new_comment"
  post '/comments/new/:id'                  => 'comments#create'
  get 'comments/:id'                        => 'comments#show'
  get '/comments/:comment_id/edit'                  => 'comments#edit',  as: 'edit_comment'
  patch '/comments/:comment_id'             => 'comments#update', as: 'update_comment' 
  put '/comments/:comment_id'               => 'comments#update' 

end
