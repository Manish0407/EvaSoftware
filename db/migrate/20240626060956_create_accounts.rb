class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :email
      t.string :gst_number
      t.string :website
      t.string :external_account_code
      t.string :remark
      t.string :phone_number
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
