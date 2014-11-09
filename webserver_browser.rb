require 'socket'

host = 'www.tutorialspoint.com'
host2 = 'localhost'
host3 = '127.0.0.1'
port = 80
port2 = 2000
path = "index.htm"

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host2, port2)
socket.print(request)
response = socket.read

all = response

headers, body = response.split("\r\n\r\n", 2)
if body == nil
  body = headers
end


#puts headers
#puts "headers = #{headers}"
puts body

#print all

  	