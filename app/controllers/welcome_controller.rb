class WelcomeController < ApplicationController
  def profile
  	@user = current_user
  end

  def update
  	@user = current_user
	end

end
