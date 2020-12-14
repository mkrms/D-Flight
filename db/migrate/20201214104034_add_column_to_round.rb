class AddColumnToRound < ActiveRecord::Migration[5.2]
  def change
    add_reference :rounds, :countup, foreign_key: true
  end
end
