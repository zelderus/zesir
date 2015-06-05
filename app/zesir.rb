require_relative 'types'
require_relative 'worker'

require 'socket'



# ------------ opened fd from argument ------------
sock = ARGV[0]
if sock.nil?
	puts "error sock"
	exit 1;
end
puts "socket: #{sock};"
sock = sock.to_i(10)
# Socket
sess = nil
begin
	sess = Socket.for_fd(sock)
	puts "remote addr: #{sess.remote_address}"
rescue => e
	puts "error socket: #{e}" 
ensure

end

if sess.nil?
	exit 2
end



# ------------ working ------------

# recieve
maxreqsize = 1024
request = sess.recv maxreqsize
sess.close_read


# worker
worker = Zesir::Worker.new
# parse request
worker.do_parse_request request
# response
response = worker.do_response


# headers
status 	= response.status
cntype 	= response.content_type
cntsize	= response.content.length
# msg content
resp = "HTTP/1.0 #{status}\nServer: zex\nContent-Type: #{cntype}\nStatus: #{status}\nContent-Length: #{cntsize}\n\n"
resp += response.content
resp += "\n\r\r"
# send
sess.print resp

# ------------ close ------------
sess.close
exit 0


