class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
    t.string "r_first"
    t.string "r_second"
    t.string "r_third"
    t.integer "r_sum"
    t.float "r_ave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "countup_id"
    t.integer "zeroone_id"
    t.index ["countup_id"], name: "index_rounds_on_countup_id"
    t.index ["zeroone_id"], name: "index_rounds_on_zeroone_id"

      t.timestamps
    end
  end
end
