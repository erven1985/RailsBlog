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

private
def post_params
	params.require(:post).permit(:topic, :content, :user_id)
end


	def show 

	end

	def edit 
		@post = Post.find(params[:id])
	end

	def update
    @post = Post.find(params[:id])
    @post.update({
      topic: params[:post][:topic],
      price: params[:post][:content],
      user_id: params[:post][:user_id]
    })
    if (@post)
      redirect_to url_for(:controller => :posts, :action => :show)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
end	


  def destroy
    Post.delete(params[:id])
    @comments = Comment.where(post_id:params[:id])
    @comments.delete
    redirect_to url_for(:controller => :posts, :action => :show)
  end


end
