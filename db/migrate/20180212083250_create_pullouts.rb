class CreatePullouts < ActiveRecord::Migration[5.1]
  def change
    create_table :pullouts do |t|
      t.references :store, foreign_key: true
      t.integer :total_items, null: false
      t.decimal :total_cost, precision: 10,scale: 2, null: false
      t.decimal :total_price, precision: 10,scale: 2, null: false
      t.text :description

      t.timestamps
    end
  end
end
