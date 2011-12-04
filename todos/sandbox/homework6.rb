
require_relative "../config/environment"

def general_queries
  puts "some general queries: "
  puts " first user login:  #{User.first.login}"
  puts " last user login:  #{User.last.login}"
  puts " all user: #{User.all}"
  puts 
end

# - (1) retrieve todoitems from todolists - (2) retrieve todoitems from users
def requirement4 
  puts "requirement #4: "
  puts "todoitems for user: #{User.first.account.first_name}"
  User.first.todolists.each {|l| puts " list name: #{l.list_name} due date: #{l.list_due_date}" }
  User.first.todoitems.each {|i| puts " item: #{i.task_title} due date: #{i.due_date}" }
  puts 
  puts "todoitems from todolist: #{Todolist.last.list_name}"
  Todolist.last.todoitems.each_with_index {|t,i| puts " item #{i}: #{t.task_title}" }
  puts "todoitems from todolist: #{Todolist.first.list_name}"
  Todolist.first.todoitems.each_with_index {|t,i| puts " item #{i}: #{t.task_title}" }
  puts 
end

# - validate gender field on account: "male", "female", or "N/A"
def requirement5
  puts "requirement #5: "
  Account.create([ { :gender => "femaleee", :age => 99, :first_name => "Mildred",  :last_name => "Marshall" } ])
  Account.create([ { :gender => "n/a", :age => 99, :first_name => "Mildred",  :last_name => "Marshall" } ])
  Account.create([ { :gender => "NA", :age => 99, :first_name => "Mildred",  :last_name => "Marshall" } ])
  Account.create([ { :gender => "N/A", :age => 99, :first_name => "Mildred",  :last_name => "Marshall" } ])
  puts
end

# - return todoitems and todolists in ascending order by default
def requirement6
  puts "requirement #6: "
  User.first.todolists.each {|l| puts " list name: #{l.list_name} due date: #{l.list_due_date}" }
  User.first.todoitems.each {|i| puts " item: #{i.task_title} due date: #{i.due_date}" }
  puts
end


#general_queries
requirement4
requirement5
requirement6
