class AddWorldToCorral < ActiveRecord::Migration[5.2]
  def change
    add_column :corrals, :world_id, :integer
  end
end
