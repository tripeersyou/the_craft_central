class CreateEndingInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :ending_inventories do |t|
      t.references :store, foreign_key: true
      t.decimal :sales, precision: 2
      t.decimal :cogs, precision: 2

      t.timestamps
    end
  end
end
