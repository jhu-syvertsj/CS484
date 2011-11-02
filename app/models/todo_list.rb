class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items

  default_scope order('todo_lists.list_due_date ASC')
end
