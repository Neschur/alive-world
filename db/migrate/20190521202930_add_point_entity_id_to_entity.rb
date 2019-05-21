class AddPointEntityIdToEntity < ActiveRecord::Migration[5.2]
  def change
    add_column :entities, :point_id, :integer
  end
end
