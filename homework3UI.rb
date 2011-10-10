
=begin

  Description:
    crude rubyTk launcher for homework3
  
  Run:
    # ruby homework3UI.rb

=end

require 'tk'

# create root window
root = TkRoot.new { title "CS484: homework3"; minsize(250, 30) }

# populate root window with widgets

hw_label = TkLabel.new (root) do
  text "Homework 3"
  foreground "darkblue"
  pack 
end

db_generator = TkButton.new (root) do 
  text "Run DB Generator"
  command { system("ruby db_generator.rb") }
  pack('padx'=>10, 'pady'=>5, 'side'=>'left')
end

db_client = TkButton.new (root) do 
  text "Run DB Client"
  command { system("ruby db_client.rb") }
  pack('padx'=>1, 'pady'=>5, 'side'=>'left')
end

exit_button = TkButton.new (root) do 
  text "Exit"
  command { exit }
  pack('padx'=>1, 'pady'=>5, 'side'=>'left')
end

Tk.mainloop
