class CreateOrderOfServices < ActiveRecord::Migration[6.0]
  def change
    create_table :order_of_services, id: :uuid do |t|
      t.integer :os_number
      t.string :reason_called
      t.text :message
      t.string :place_of_performance
      t.datetime :start_date_os
      t.datetime :end_date_os
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
