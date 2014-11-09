require 'json' 

printf "enter user name and email separated with space: "
post_input = gets.chomp.split(" ")
z =  { post_input[0] => { :name => post_input[0], :email => post_input[1] } }
j = z.to_json

pat = "<%= yield %>"

nj = JSON.parse(j)
#puts nj
#puts nj.class
#puts nj.inspect

params = {}
params.merge!(nj)
puts params

puts "-----------------------------------"

printf "enter user name and email separated with space: "
post_input = gets.chomp.split(" ")
z =  { post_input[0] => { :name => post_input[0], :email => post_input[1] } }
j = z.to_json

nj = JSON.parse(j)
#puts nj
#puts nj.class
#puts nj.inspect


params.merge!(nj)


rep = "<li>#{params.keys[0]}<li>\n\t<li>#{params.keys[1]}<li>\n\t<li>3<li>"

File.open('thanks.html', 'r') do |file|
  	f  = file.read
  	puts f.gsub!(pat, rep)
  end
