class CommentsController < ApplicationController
  def index
  end

  def create
  	@comment = Comment.new
  	@comment.comment = params[:comment]
  	@comment.user_id = params[:user_id]
  	@comment.message_id = params[:message_id]
  	@comment.save
  	redirect_to "/walls/show"
  end
end
