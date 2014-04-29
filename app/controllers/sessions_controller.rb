class SessionsController < ApplicationController
    include SessionsHelper

  # L O G I N 

  def new
  	# Renders view page for new login form
  end

  def create
  	user = User.authenticate(params[:email_address], params[:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render '/sessions/new'
    else
      sign_in user
    end
  end

  def show
    deny_access if (session[:user_id] == nil)
    @user = User.find(session[:user_id])
    @nonfriends = User.all-@user.friends
  end

  def destroy
  	sign_out_redirect
  end

end
