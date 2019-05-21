class DropPointEntities < ActiveRecord::Migration[5.2]
  def change
    drop_table :point_entities do |t|
      t.integer :point_id
      t.integer :entity_id

      t.timestamps
    end
  end
end
