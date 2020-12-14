class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :r_first
      t.string :r_second
      t.string :r_third
      t.integer :r_sum
      t.float :r_ave

      t.timestamps
    end
  end
end
