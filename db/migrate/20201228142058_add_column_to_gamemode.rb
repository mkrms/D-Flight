class AddColumnToGamemode < ActiveRecord::Migration[5.2]
  def change
    add_column :gamemodes, :modename, :string
  end
end
