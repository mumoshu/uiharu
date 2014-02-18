class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :assignee_id
      t.integer :assignor_id
      t.date :start_date
      t.date :due_date
      t.date :finish_date

      t.timestamps
    end
  end
end
