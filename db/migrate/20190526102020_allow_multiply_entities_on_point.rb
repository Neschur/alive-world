class AllowMultiplyEntitiesOnPoint < ActiveRecord::Migration[5.2]
  def change
    remove_column :points, :entity_id, :integer
    add_column :entities, :point_id, :integer
  end
end
