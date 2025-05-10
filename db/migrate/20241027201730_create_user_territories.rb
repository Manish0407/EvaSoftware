class CreateUserTerritories < ActiveRecord::Migration[7.1]
  def change
    create_table :user_territories do |t|
      t.integer :employee_id
      t.integer :territory_master_id

      t.timestamps
    end
  end
end
