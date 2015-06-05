require 'socket'

# ------------ opened fd in argument ------------
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
#puts "recieve: #{buf}"
# TODO parse request


# TODO content
content = "<div>ruuubyyy</div>"



# status
status 	= "200 OK"
cntype 	= "text/html;charset=utf-8"
cntsize	= content.length
# response
resp = "HTTP/1.0 #{status}\nServer: zex\nContent-Type: #{cntype}\nStatus: #{status}\nContent-Length: #{cntsize}\n\n"
resp += content
resp += "\n\r\r"
# send
sess.print resp


# ------------ close ------------
sess.close
exit 0


