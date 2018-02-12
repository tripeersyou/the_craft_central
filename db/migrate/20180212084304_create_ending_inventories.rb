class CreateEndingInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :ending_inventories do |t|
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
