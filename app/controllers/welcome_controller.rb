class WelcomeController < ApplicationController
  def profile
  	@user = current_user
  end

  def update
  	@user = current_user
	end

	def all
  	@users = User.all
	end

  def show 
    @user_by_id = User.find(params[:id])
  end
end
