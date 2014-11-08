require 'socket'


host = 'localhost'
port = 2000


path = ""
  	while path != "q"
  	  printf "enter adress: "
  	  path = gets.chomp
  	  case path
  	    when 'q' then puts "stop client"
  	    else
  	      request = "GET #{path} HTTP/1.0\r\n\r\n"
  	      puts request
  	      socket = TCPSocket.open(host, port)
  	      #path = "index.html"
  	      
		  socket.print(request)
		  response = socket.read
		  all = response
		  headers, body = response.split("\r\n\r\n", 2)
		  puts body
  	  end
  	end


