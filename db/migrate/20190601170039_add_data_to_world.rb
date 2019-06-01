class AddDataToWorld < ActiveRecord::Migration[5.2]
  def change
    add_column :worlds, :data, :json
  end
end
