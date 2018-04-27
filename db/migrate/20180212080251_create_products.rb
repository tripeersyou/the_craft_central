class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.references :brand, foreign_key: true
      t.text :description
      t.integer :limit, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :cost, precision: 10, scale: 2, null: false
      t.integer :inventory, null: false

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
