class CreatePaymentGateways < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_gateways do |t|
      t.integer :opportunity_id
      t.string :payment_medium
      t.string :transaction_no
      t.decimal :amount
      t.datetime :payment_date_and_time
      t.text :description
      t.text :reason
      t.integer :audit_status

      t.timestamps
    end
  end
end
