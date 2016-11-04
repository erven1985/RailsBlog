	class CommentsController < ApplicationController

before_action :authenticate_user!
def index 
	@comments = Comment.where(user_id:params[:id])
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
	
end

def edit 
	@comment = Comment.find(params[:id])

end

def update
    @comment = Comment.find(params[:id])    
    if @comment.update({
      username: params[:comment][:username],
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      post_id: params[:comment][:post_id]
    })
      redirect_to comments_path(current_user.id)
    else
      redirect_to url_for(:controller => :comments, :action => :index)
    end
	end	


	def destroy
	  @comment = Comment.find(params[:id])
	  @comment.destroy
	  redirect_to url_for(:controller => :welcome, :action => :profile)
	end




private
def comment_params
	params.require(:comment).permit(:username, :content, :user_id, :post_id)
	end




end
 