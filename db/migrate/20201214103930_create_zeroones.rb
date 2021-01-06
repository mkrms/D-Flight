class CreateZeroones < ActiveRecord::Migration[5.2]
  def change
    create_table :zeroones do |t|
      t.float :rate
      t.references :gamemode, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :remain
      t.float :ave

      t.timestamps
    end
  end
end
