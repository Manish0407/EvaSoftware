class CreateWindowMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :window_materials do |t|
      t.references :window
      t.references :material, polymorphic: true
      t.timestamps
    end
  end
end
