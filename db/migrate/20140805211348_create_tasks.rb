class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :task_list_id
      t.string :name
      t.string :date
    end
  end
end
