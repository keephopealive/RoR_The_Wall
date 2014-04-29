class MessagesController < ApplicationController
  def index
  end

  def create
  	@message = Message.new
  	@message.message = params[:message]
  	@message.user_id = params[:user_id]
  	@message.save
  	redirect_to "/walls/show"
  end
end
