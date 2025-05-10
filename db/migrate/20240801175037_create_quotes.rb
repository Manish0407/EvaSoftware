class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.decimal :area
      t.decimal :price
      t.integer :opportunity_id
      t.datetime :expected_quote_start_date
      t.datetime :expected_quote_end_date

      t.timestamps
    end
  end
end
