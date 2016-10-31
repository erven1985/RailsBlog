class CommentsController < ApplicationController

def index 
	@post = Post.find(params[:id])
	@author = User.find(@post.user_id)
	@comments = Comment.where(post_id:params[:id])
end	

def new
	@post = Post.find(params[:id])
	@user = current_user
	@comment = Comment.new
end

def create
	@comment = Comment.new(comment_params)
	@comment.save
	if @comment.save
		redirect_to posts_path(@post)
	end
end

private
def comment_params
	params.require(:comment).permit(:username, :content, :user_id, :post_id)
	end

def show
	
end


end
 