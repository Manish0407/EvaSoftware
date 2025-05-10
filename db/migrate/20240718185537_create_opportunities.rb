class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities do |t|
      t.string :project_name
      t.string :full_name
      t.string :salutation
      t.string :phone_number
      t.string :email
      t.text :note
      t.string :address1
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :bill_to
      t.string :marketing_partner
      t.integer :employee_id
      t.integer :account_id
      t.string :opportunity_stage
      t.string :opportunity_source
      t.string :opportunity_category
      t.decimal :estimated_opportunity_value
      t.date :expected_closure_date
      t.date :expected_supply_start_date
      t.date :expected_supply_end_date

      t.timestamps
    end
  end
end
