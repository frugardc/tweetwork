module Tweetwork
	class Network
		attr_accessor :tweets,:tweeters
		def initialize(filepath)
			@tweets = []
			@tweeters = {}
			if File.exists?(filepath)
				load_from_file(filepath)
			else
				raise Exception.new("cannot find this file - #{filepath}")
			end
		end

		private

		def load_from_file(filepath)
  		File.open(filepath, "r") do |infile|
  		  while (line = infile.gets)
  		    @tweets << Tweetwork::Tweet.new(line,self)
  		  end
  		end
		end
	end
end