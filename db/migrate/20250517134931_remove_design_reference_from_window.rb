class RemoveDesignReferenceFromWindow < ActiveRecord::Migration[7.1]
  def change
    remove_reference :windows, :design
  end
end
