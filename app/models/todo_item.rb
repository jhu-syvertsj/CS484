class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_and_belongs_to_many :tags

  default_scope order('todo_items.due_date ASC')
end
