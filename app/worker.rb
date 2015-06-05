require_relative 'types'

module Zesir

	# main worker
	class Worker

		def initialize
			
		end



		# parse request
		def do_parse_request (request)
			@request = Zesir::Request.new			
			# TODO
			
		end




		# main response
		def do_response
			response = Zesir::Response.new
			# TODO
			response.content = "<div>rruuuuu</div>";

			return response
		end



	end



end
