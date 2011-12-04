
# reset:
User.delete_all
Account.delete_all
Todoitem.delete_all
Todolist.delete_all
Tag.delete_all

puts " - table data cleared"

# populate user table (works):
#User.create([ { :login => "sophia", :password => "imcute" } ])
#User.create([ { :login => "wayne.newton", :password => "ilovelasvegas" } ])
#puts " - User table populated"

# populate account table (works, but not the right solution):
#Account.create([ { :gender => "female", :age => 1, :first_name => "Sophia",  :last_name => "Syvertsen" } ])
#puts " - Accounts table populated"

# append account to user table (fails):
#User.first.account << Account.first
#puts " - Accounts table appended to Users table"
# note: this probably fails because the account has a one-to-one association with the user

# populate user table and accounts with todolist (fails):
#User.create([ { :login => "sophia", :password => "imcute", :account => Account.create({ :gender => "female", :age => 1, :first_name => "Sophia",  :last_name => "Syvertsen" }), :todolist => Todolist.create({ :list_name => "sophia daily list", :list_due_date => "11/11/11" }) } ])
#puts " - User table and accounts populated with todolist"
# note: this fails because the todolist has a many-to-one association with user,
# as opposed to account, which is one-to-one with user.

# populate user table and accounts (works):
User.create([ { :login => "sophia", :password => "imcute", :account => Account.create({ :gender => "female", :age => 1, :first_name => "Sophia",  :last_name => "Baby" }) } ])
User.create([ { :login => "wayne.newton", :password => "lovevegas", :account => Account.create({ :gender => "male", :age => 71, :first_name => "Wayne",  :last_name => "Newton" }) } ])
puts " - User table and accounts populated"

# populate todolist table (works):
User.first.todolists << Todolist.create([ { :list_name => "baby daily list", :list_due_date => "11/11/11" } ]) 
User.first.todolists << Todolist.create([ { :list_name => "family visit", :list_due_date => "12/05/11" } ])
User.last.todolists  << Todolist.create([ { :list_name => "waynes list", :list_due_date => "12/12/12" } ])
puts " - Todolist table populated"

# add todoitems to todolist
User.first.todolists.first.todoitems << Todoitem.create([ { :task_title => "Cry at night", :description => "this is every night", due_date: "11/11/11" } ])
User.first.todolists.first.todoitems << Todoitem.create([ { :task_title => "Visit grandparents", :description => "visit grandparents", due_date: "12/05/11" } ])
User.last.todolists.first.todoitems  << Todoitem.create([ { :task_title => "Sell tickets", :description => "sell tickets for concert", due_date: "12/01/11" } ])
puts " - Todoitems table populated and added to Todolists"

# add tags to todoitems
User.first.todolists.first.todoitems.first.tags << Tag.create([ { :tag_name => "Baby Activity" }, { :tag_name => "Sophia's Daily Activities" } ])
#User.first.todolists.last.todoitems.first.tags  << Tag.create([ { :tag_name => "Family Visit" } ])
User.last.todolists.first.todoitems.first.tags  << Tag.create([ { :tag_name => "Performance" } ])
puts " - Tags table populated and added to Todoitems"
