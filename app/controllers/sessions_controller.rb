class SessionsController < ApplicationController
    include SessionsHelper

  # L O G I N 

  def new
  end

  def create
  	user = User.authenticate(params[:email_address], params[:password])
    if user.nil?
      # LOGIN - FAIL
      # render :text => 'login failed'
      flash.now[:error] = "Invalid email/password combination."
      render '/sessions/new'
    else
      # LOGIN - SUCCESS
      puts user
      puts user.id
      puts user.first_name

      sign_in user
      redirect_to user

      # render :text => "VALID info = SUCCESS"
      # render => user

      # render :text => 'login success'
    	# sign_in(user)
      # redirect_to '/sessions/#{user.id}'
    end
  end

  def show

  end

  def destroy
  	sign_out
  	redirect_to signin_path
  end

end
