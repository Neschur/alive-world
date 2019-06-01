class CreateWorld < ActiveRecord::Migration[5.2]
  def change
    enable_extension "plpgsql"
    enable_extension 'pgcrypto'

    create_table "worlds", id: :uuid, force: :cascade do |t|
      t.json "data", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
