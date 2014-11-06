require 'socket'

filename = "index.html"

def get_content
  File.open(filename, 'r') do |file|
  	file.read
  end
end

server = TCPServer.open(2000)
loop {
	client = server.accept
	client.puts(Time.now.ctime)
	client.puts get_content
	client.puts "Closing the connection. Bye!"
	client.close
}