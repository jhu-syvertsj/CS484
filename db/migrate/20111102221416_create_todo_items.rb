class CreateTodoItems < ActiveRecord::Migration
  def self.up
    create_table :todo_items do |t|
      t.string :task_title
      t.string :description
      t.date :due_date
      t.references :todo_list

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_items
  end
end
