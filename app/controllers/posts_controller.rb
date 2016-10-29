class PostsController < ApplicationController

	def show 
		@posts = Post.all
		@post = Post.new
	end
	
	def new
		@post = Post.new(post_params)
		if @post.save
	# @post_new =	Post.create(topic: params[:topic], content: params[:content], user_id: current_user.id)
	redirect_to '/posts'
else 
	redirect_to '/users'
	
	end
end
private
def post_params
	params.require(:post).permit(:topic, :content, :user_id)
end


end
