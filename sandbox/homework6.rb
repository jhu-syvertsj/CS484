require_relative "../config/environment"

# Req 4
puts "#{User.first.login} has the following tasks (using :through)"
User.first.todo_items.each{|item| puts "#{item.task_title} due #{item.due_date}"}
puts

# Req 5
puts "Attempting to create account using gender = mule"
puts Account.create({first_name: "Bob", last_name: "Johnson", age: 29, gender: "mule"}).errors
puts

# Req 6
puts "Lists in order..."
User.first.todo_lists.each{|list| puts "#{list.list_name} due #{list.list_due_date}"}
puts "Items in order..."
User.first.todo_items.each{|item| puts "#{item.task_title} due #{item.due_date}"}
puts

# Various retrieves
user = User.first
puts "Printing some data about user with login #{user.login}:"
puts "My name is #{user.account.first_name} #{user.account.last_name}."
puts "My first list is titled: #{user.todo_lists.first.list_name}."
puts "The first todo item in that list is titled: #{user.todo_lists.first.todo_items.first.task_title}."
puts "The following tags apply to that item:"
user.todo_lists.first.todo_items.first.tags.each{|tag| puts tag.tag_name}
puts "Tag #{user.todo_lists.first.todo_items.first.tags.first.tag_name} is applied to these todo items:"
user.todo_lists.first.todo_items.first.tags.first.todo_items.each{|item| puts "#{item.task_title} due #{item.due_date}"}