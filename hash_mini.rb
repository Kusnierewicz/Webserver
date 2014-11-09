require 'json' 

printf "enter user name and email separated with space: "
post_input = gets.chomp.split(" ")
z =  { :viking => { :name => post_input[0], :email => post_input[1] } }

puts z
puts z.class
puts z[:viking]
puts z[:viking][:name]
puts z[:viking][:email]

j = z.to_json

puts j