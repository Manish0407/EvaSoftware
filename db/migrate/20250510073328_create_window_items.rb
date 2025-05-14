class CreateWindowItems < ActiveRecord::Migration[7.1]
  def change
    create_table :window_items do |t|
      t.references :window
      t.references :material, polymorphic: true
      t.integer :quantity
      t.decimal :negotiated_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
