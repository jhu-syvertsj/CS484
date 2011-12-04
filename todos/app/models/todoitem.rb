class Todoitem < ActiveRecord::Base
  belongs_to :todolist
  has_and_belongs_to_many :tags
  default_scope order('due_date ASC')
end
