class RenameControllerWallWalls < ActiveRecord::Migration
  def change
  	rename_table :Wall, :Walls
  end
end
