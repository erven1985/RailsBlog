class PostsController < ApplicationController

	before_action :authenticate_user!
	def index 
		@posts = Post.all
		@post = Post.new
	end
	
	def new
		@post = Post.new(post_params)
		if @post.save
			redirect_to '/posts'
		else 
			redirect_to '/users'
	
		end
	end


	def show 
	end

	# show form to update a specific user's specific post
	def edit 
		@post = Post.find(params[:post_id])
		puts "THIS IS THE FOUND POST:"
		puts @post

		@user = current_user.id
	end


	# receive data from the Edit form 
	# update post in DB 
	def update
    @post = Post.find(params[:post_id])    

    @post.update({
      topic: params[:post][:topic],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    })


    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
	end	


	def destroy
	  @post = Post.find(params[:post_id])
	  @post.destroy
	  redirect_to url_for(:controller => :posts, :action => :index)
	end


private

def post_params
	params.require(:post).permit(:topic, :content, :user_id)
end

 
end
