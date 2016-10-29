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

	def edit 
	@user = current_user
  
  a = @user.update(firstname: params[:firstname])
  c = @user.update(lastname: params[:lastname])
  b = @user.update(username: params[:username])
  d = @user.update(dob: params[:dob])
  e = @user.update(gender: params[:gender])

	end	

end
