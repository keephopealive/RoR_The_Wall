class RenameCommentMessageToComment < ActiveRecord::Migration
  def change
  	rename_column :Comments, :message, :comment
  end
end
