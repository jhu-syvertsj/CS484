class CreateTodoItemsTags < ActiveRecord::Migration
  def self.up
    create_table :tags_todo_items, id: false do |t|
	  t.references :tag
	  t.references :todo_item
	end
  end

  def self.down
    drop_table :tags_todo_items
  end
end
