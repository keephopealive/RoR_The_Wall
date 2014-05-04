class FriendshipsController < ApplicationController
  def show
  	@user = User.find(session[:user_id])
  	@nonfriends = User.all-@user.friends
  end

  def create
  	# render :text => "Made it to Friendships Controller / Create"
  	@user = User.find(session[:user_id])
  	@friendship = @user.friendships.build(:friend_id => params[:friend_id])
  	if @friendship.save
  		flash[:notice] = 'Friend Added'
  	else
  		flash[:notice] = 'Unable to add this friend.'
  	end
  	redirect_to '/friendships/'+@user.id.to_s
  end

  def destroy
  	# render :text => "Made it to Friendships Controller / Destroy"
 	@user = User.find(session[:user_id])
  	@friendshipDelete = Friendship.where("user_id= ? AND friend_id= ?",@user.id,params[:friend_id]).delete_all
  	if @friendshipDelete
  		flash[:notice] = 'Friend Removed'
  	else
  		flash[:notice] = 'Unable to remove this friend'
  	end
  	redirect_to '/friendships/'+@user.id.to_s
  end

  def showOther
    # render :text => "Welcome to showOthers"
    @user = User.find(session[:user_id])
    @otherUser = User.find(params[:friend_id])
  end
end
  	# @friendshipDelete = Friendship.where("user_id='" + session[:user_id].to_s + "' AND friend_id='"+ params[:friend_id].to_s+"'").delete_all
