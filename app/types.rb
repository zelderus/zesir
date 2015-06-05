
module Zesir

	# test
	class A
		def test
			puts "tt"
		end
	end



	# response to a server
	class Response
		attr_accessor :status, :content_type, :content
		def initialize
			@status 		= "200 OK";
			@content_type 	= "text/html;charset=utf-8";
			@content		= "";
		end
	end


	# request data
	class Request
		
		def initialize
			@method 		= "GET";
			@url 			= "/";
		end

	end



end
