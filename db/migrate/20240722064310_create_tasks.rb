class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.integer :employee_id
      t.string :task_medium
      t.datetime :schedule
      t.string :status
      t.text :task_description
      t.integer :opportunity_id
      t.string :opportunity_stage
      t.integer :contact_id

      t.timestamps
    end
  end
end
