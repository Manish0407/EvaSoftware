class AddRoleToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :role, :integer
    add_column :admin_users, :full_name, :string
  end
end
