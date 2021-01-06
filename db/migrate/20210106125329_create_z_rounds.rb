class CreateZRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :z_rounds do |t|
      t.integer :r_first
      t.integer :r_second
      t.integer :r_third
      t.integer :r_sum
      t.float :r_ave
      t.references :zeroone, foreign_key: true

      t.timestamps
    end
  end
end
