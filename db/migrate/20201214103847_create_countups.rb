class CreateCountups < ActiveRecord::Migration[5.2]
  def change
    create_table :countups do |t|
      t.float "rate"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "gamemode_id"
      t.integer "user_id"
      t.integer "score"
      t.float "ave"
      t.index ["gamemode_id"], name: "index_countups_on_gamemode_id"
      t.index ["user_id"], name: "index_countups_on_user_id"

      t.timestamps
    end
  end
end
