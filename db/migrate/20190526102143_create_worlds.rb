class CreateWorlds < ActiveRecord::Migration[5.2]
  def change
    create_table :worlds do |t|
      t.uuid :uuid

      t.timestamps
    end
  end
end
