# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Tag.delete_all
TodoItem.delete_all
TodoList.delete_all
Account.delete_all
User.delete_all

User.create [
  {login: "doejo", password: "password1", account: Account.create({first_name: "John", last_name: "Doe", age: 29, gender: "male"})},
  {login: "doeja", password: "password2", account: Account.create({first_name: "Jane", last_name: "Doe", age: 28, gender: "female"})}
]

User.first.todo_lists << TodoList.create([{ list_name: "Third List", list_due_date: Date.parse("01/11/2012") }])
User.first.todo_lists << TodoList.create([{ list_name: "Second List", list_due_date: Date.parse("10/10/2012") }])
User.first.todo_lists << TodoList.create([{ list_name: "First List", list_due_date: Date.parse("11/09/2012") }])

User.first.todo_lists.first.todo_items << TodoItem.create([{ task_title: "Third Task", description: "This task is nearly impossible!", due_date: Date.parse("10/01/2012") }])
User.first.todo_lists.first.todo_items << TodoItem.create([{ task_title: "First Task", description: "Really easy task.", due_date: Date.parse("08/01/2012") }])
User.first.todo_lists.first.todo_items << TodoItem.create([{ task_title: "Second Task", description: "Somewhat harder task.", due_date: Date.parse("09/01/2012") }])

User.first.todo_lists.first.todo_items.first.tags << Tag.create([{ tag_name: "Test Tag 1" }, { tag_name: "Test Tag 2" }, { tag_name: "Test Tag 3" }])
User.first.todo_lists.first.todo_items.last.tags << User.first.todo_lists.first.todo_items.first.tags