class WallsController < ApplicationController
	  include SessionsHelper

  def index
  end

  def friends
  end

  def show
 	@user = User.find(session[:user_id])
  @nonfriends = User.all-@user.friends

  	@messages = Message.all
  	@comments = Comment.all
  	render :layout => 'wall'
  end
end