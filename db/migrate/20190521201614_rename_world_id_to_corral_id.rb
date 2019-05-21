class RenameWorldIdToCorralId < ActiveRecord::Migration[5.2]
  def change
    rename_column :points, :world_id, :corral_id
  end
end
