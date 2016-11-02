class CommentsController < ApplicationController

before_action :authenticate_user!
def index 
	@post = Post.find(params[:id])
	@author = User.find(@post.user_id)
	@comments = Comment.where(post_id:params[:id])
end	

def new
	@post = Post.find(params[:id])
	@user = current_user
	@comment = @post.comments.build
end

def create
	@comment = Comment.new(comment_params)
	@comment.save
	if @comment.save
		redirect_to posts_path(@post)
	end
end

def show
	@comments = Comment.where(user_id: params[:id])
end

def edit 
	@comment = Comment.find(params[:comment_id])

end

def update
    @comment = Comment.find(params[:comment_id])    

    @comment.update({
      username: params[:comment][:username],
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      post_id: params[:comment][:post_id]
    })


    if (@post)
      redirect_to url_for(:controller => :comments, :action => :show)
    else
      redirect_to url_for(:controller => :comments, :action => :index)
    end
	end	




private
def comment_params
	params.require(:comment).permit(:username, :content, :user_id, :post_id)
	end




end
 