class CreateGamemodes < ActiveRecord::Migration[5.2]
  def change
    create_table :gamemodes do |t|

      t.timestamps
    end
  end
end
