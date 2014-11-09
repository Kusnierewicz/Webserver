require 'socket'


host = 'localhost'
port = 2000


command = ""
  	while command != "q"
  	  printf "enter adress: "

  	  input = gets.chomp
  	  parts = input.split(" ")
  	  command = parts[0]
  	  path = parts[1]
  	  case command
  	    when 'q' then puts "stop client"
  	    when 'get' then
  	      request = "GET #{path} HTTP/1.0\r\n\r\n"	      
  	      socket = TCPSocket.open(host, port)
		  socket.print(request)
		  response = socket.read
		  all = response
		  headers, body = response.split("\r\n\r\n", 2)
		  if body == nil
  			body = headers
		  end
		  puts body
		when 'post' then
		  printf "enter user name and email separated with space: "
  	  	  post_input = gets.chomp.split(" ")
  	  	  data = 
  	  	  
  	      request = "POST #{path} HTTP/1.0\r\n\r\n"	      
  	      socket = TCPSocket.open(host, port)
		  socket.print(request)
		  response = socket.read
		  all = response
		  headers, body = response.split("\r\n\r\n", 2)
		  if body == nil
  			body = headers
		  end
		  puts body
		else
		  puts "wrong command"
  	  end
  	end


