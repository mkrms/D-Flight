class AddColumnToCountup < ActiveRecord::Migration[5.2]
  def change
    add_reference :countups, :gamemode, foreign_key: true
    add_reference :countups, :user, foreign_key: true
  end
end
