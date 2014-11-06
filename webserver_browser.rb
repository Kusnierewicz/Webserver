require 'socket'

host = 'www.tutorialspoint.com'
host2 = 'localhost'
port = 2000
path = "/index.htm"

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host2, port)
socket.print(request)
response = socket.read

headers, body = response.split("\r\n\r\n", 2)
print body