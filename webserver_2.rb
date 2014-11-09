require 'socket'
require 'json'

def exist(file)
  File.file?(file)
end

def get_content(file)
  File.open(file, 'r') do |file|
  	file.read
  end
end

def get_length(file)
  text = get_content(file)
  text.length
end



def response(command, request, length = "0")
  case command
  	when 200 then "#{request[2]} 200 OK\n\r#{Time.now.ctime}\n\rServer: ByKusnier\n\rContent Length: #{length}\n\rVary: Accept-Encoding\n\rConnection: \n\rContent-Type: text/html; charset-iso:}"
  	when 404 then "#{request[2]} 404 File not found\n\r#{Time.now.ctime}\n\rServer: ByKusnier\n\rContent Length: #{length}\n\rVary: Accept-Encoding\n\rConnection: \n\rContent-Type: text/html; charset-iso:}"
  	else
  	  "new\n\rline\n\rtext"
  end 
end

server = TCPServer.open(2000)

loop {

	client = server.accept
	request = client.gets.split(" ")

	if request[2] == "HTTP/1.1" || request[2] == "HTTP/1.0"
	  if request[0] == "GET"
	  	if exist(request[1])
	  	  
	  	  client.puts("#{response(200, request, get_length(request[1]))}\r\n\r\n#{get_content(request[1])}")
	  	  #client.puts(response(200, request))
	  	  #client.puts(get_content(request[1]))
	  	else
	  	  response(404, request)
	  	  client.puts(response(404, request))
	  	  
	  	end
	  elsif request[0] == "POST"
	  	puts "command POST is not working"
	  else
	  	client.puts("wrong command")
	  end
	else
	  client.puts("wrong protocol")
	end

	#client.puts "Closing the connection. Bye!"
	client.close

}