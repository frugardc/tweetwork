module Tweetwork
	class Tweeter
		attr_accessor :username, :tweets, :mentioned, :mentioned_by,:first_degree_connections,
			:second_degree_connections,:third_degree_connections
		def initialize(username)
			@username = username
			@tweets = []
			@mentioned_by = []
			@mentioned = []
			@first_degree_connections = []
			@second_degree_connections = []
			@third_degree_connections = []
		end

		def add_mentioned(tweeter)
			if not @mentioned.include?(tweeter)
				@mentioned << tweeter
			end
			if @mentioned_by.include?(tweeter) #&& (!@first_degree_connections.include?(tweeter))
				@first_degree_connections << tweeter
			end
		end

		def add_mentioned_by(tweeter)
			if not @mentioned_by.include?(tweeter)
				@mentioned_by << tweeter
			end
			if @mentioned.include?(tweeter) #&& (!@first_degree_connections.include?(tweeter))
				@first_degree_connections << tweeter
			end			
		end
	end
end