require 'socket'
require 'json'


host = 'localhost'
port = 2000


command = ""
  	while command != "q"
  	  printf "enter command and adress separated with space: "

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
          z =  { post_input[0] => { :name => post_input[0], :email => post_input[1] } }
          j = z.to_json
  	  	  
  	      request = "POST #{j} HTTP/1.0\r\nContent Length: #{j.length}\r\n\r\n#{j}"	      
  	      socket = TCPSocket.open(host, port)
		      socket.print(request)
		      response = socket.read
		      puts response
		      #headers, body = response.split("\r\n\r\n", 2)
		      #if body == nil
  			  #  body = headers
		      #end
		      #  puts body
		    else
		      puts "wrong command"
  	    end
  	end


