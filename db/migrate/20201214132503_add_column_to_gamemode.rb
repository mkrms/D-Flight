class AddColumnToGamemode < ActiveRecord::Migration[5.2]
  def change
    add_column :gamemodes, :modename, :string
    add_reference :gamemodes, :countup, foreign_key: true
  end
end
