class AddEntityIdToPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :entity_id, :integer
    remove_column :entities, :point_id, :integer
  end
end
