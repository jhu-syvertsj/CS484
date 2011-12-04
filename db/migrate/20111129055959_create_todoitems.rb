class CreateTodoitems < ActiveRecord::Migration
  def self.up
    create_table :todoitems do |t|
      t.string :due_date
      t.string :task_title
      t.string :description
      t.references :todolist

      t.timestamps
    end
  end

  def self.down
    drop_table :todoitems
  end
end
