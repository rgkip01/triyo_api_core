class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :customer_name
      t.string :document
      t.integer :customer_type, default: 0
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
