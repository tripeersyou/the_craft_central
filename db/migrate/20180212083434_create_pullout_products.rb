class CreatePulloutProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :pullout_products do |t|
      t.references :pullout, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :price, precision: 2, null: false
      t.decimal :cost, precision: 2, null: false

      t.timestamps
    end
  end
end
