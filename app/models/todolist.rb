class Todolist < ActiveRecord::Base
  belongs_to :user
  has_many   :todoitems
  default_scope order('list_due_date ASC')
end
