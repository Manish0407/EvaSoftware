class CreateSalesOffices < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_offices do |t|
      t.string :sales_office_name
      t.text :sales_description
      
      t.timestamps
    end
  end
end
