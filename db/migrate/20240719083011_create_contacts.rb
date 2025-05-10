class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :salutation
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :designation
      t.text :remark
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.integer :employee_id
      t.integer :account_id

      t.timestamps
    end
  end
end
