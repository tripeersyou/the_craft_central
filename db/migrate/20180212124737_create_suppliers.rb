class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :address
      t.string :contact_person
      t.string :contact_number

      t.timestamps
    end
  end
end
