class WelcomeController < ApplicationController
  
  def index

  end
  before_action :authenticate_user!
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
