class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :x
      t.integer :y
      t.integer :world_id

      t.timestamps
    end
  end
end
