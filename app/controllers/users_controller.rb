class UsersController < ApplicationController
  
  # R E G I S T R A T I O N
  
  def index
    reset_session
    flash.discard
  end

  def new
  end



  def create
    @user = User.new
    @user.user_name = flash[:user_name] = params[:user_name]
    @user.first_name = flash[:first_name] = params[:first_name]
    @user.last_name = flash[:last_name] = params[:last_name]
    @user.email_address = flash[:email_address] = params[:email_address]
    @user.password = params[:password]
    @user.save
    if @user.save
      # USER CREATION - SUCCESS
      flash.discard 
      # render :text => 'SAVED'
      redirect_to '/sessions/new'
    else
      # USER CREATION - FAILED
      # render :text => 'REROUTE'
      render '/users/new'
    end    
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
