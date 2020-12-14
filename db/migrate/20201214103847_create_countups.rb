class CreateCountups < ActiveRecord::Migration[5.2]
  def change
    create_table :countups do |t|
      t.float :rate

      t.timestamps
    end
  end
end
