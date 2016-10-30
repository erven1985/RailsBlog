class WelcomeController < ApplicationController
  
  def index

  end

	def all
  	@users = User.all
	end

  def profile
    @user = current_user
  end

  def show 
    @user_by_id = User.find(params[:id])
  end

end
