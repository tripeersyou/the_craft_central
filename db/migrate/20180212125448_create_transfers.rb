class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.references :store_to
      t.references :store_from
      t.references :pullout, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
    add_foreign_key :transfers,:stores, column: :store_to_id
    add_foreign_key :transfers,:stores, column: :store_from_id
  end
end
