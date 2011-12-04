class Todoitem < ActiveRecord::Base
  belongs_to :todolist
  has_and_belongs_to_many :tags
end
