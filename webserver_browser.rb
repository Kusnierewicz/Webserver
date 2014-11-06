require 'socket'

host = 'www.tutorialspoint.com'
host2 = 'localhost'
port = 80
port2 = 2000
path = "index.html"

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host2, port2)
socket.print(request)
response = socket.read

all = response

headers, body = response.split("\r\n\r\n", 2)



#puts "headers = #{headers.inspect}"
#puts "headers = #{headers}"
#puts "body = #{body}"

print all