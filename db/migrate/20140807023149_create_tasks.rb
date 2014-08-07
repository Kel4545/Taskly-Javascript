class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_list_id
      t.string :name
      t.date :due_date
    end
  end
end
