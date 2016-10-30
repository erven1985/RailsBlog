class PostsController < ApplicationController

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

private
def post_params
	params.require(:post).permit(:topic, :content, :user_id)
end


	def show 

	end

end
