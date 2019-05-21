class CreateCorrals < ActiveRecord::Migration[5.2]
  def change
    create_table :corrals do |t|

      t.timestamps
    end
  end
end
