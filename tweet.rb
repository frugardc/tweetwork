module Tweetwork
	class Tweet
		attr_accessor :body,:username,:user,:mentions,:network,:first_degree_connections,
			:second_degree_connections,:third_degree_connections
		def initialize(tweet,network)
			@network = network
			@mentions = []

			parts = tweet.split(":")
			# Join to the end, in case there are any colons in the rest of the tweet
			@body = parts.slice(1,parts.size - 1).join.strip
			@username = parts[0].strip.to_sym
			if not network.tweeters.keys.include?(@username)
				tweeter = Tweetwork::Tweeter.new(@username.to_s)
				network.tweeters[@username] = tweeter
			else
				tweeter = network.tweeters[@username]
			end
			tweeter.tweets << self
			mentioned_keys = @body.scan(/@\w+/).collect{|username| username.slice(1,username.size - 1).to_sym}
			mentioned_keys.each do |mentioned_key|
				if not network.tweeters.keys.include?(mentioned_key)
					mentioned = Tweetwork::Tweeter.new(mentioned_key.to_s)
					network.tweeters[mentioned_key] = mentioned
				else
					mentioned = network.tweeters[mentioned_key]
				end
				tweeter.add_mentioned(mentioned)
				mentioned.add_mentioned_by(tweeter)
				@mentions << mentioned
			end
		end
	end
end