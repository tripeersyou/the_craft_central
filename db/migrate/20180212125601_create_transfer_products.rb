class CreateTransferProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :transfer_products do |t|
      t.references :transfer, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
