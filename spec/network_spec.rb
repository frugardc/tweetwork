require "./spec_helper"

describe "Network" do
	before(:each) do
		@network = Tweetwork::Network.new("#{File.dirname(__FILE__)}/../complex_input.txt")
		@madelyn = @network.tweeters[:madelyn]
		@magali = @network.tweeters[:magali]
	end

	it "should include the tweeter called 'magali'" do
		@network.tweeters.keys.include?(:magali).should be_true
	end

	it "should catch magali's mention of madelyn" do
		@magali.mentioned.include?(@madelyn).should be_true
	end

	it "should catch madelyn's mentioned_by magali" do
		@madelyn.mentioned_by.include?(@magali).should be_true
	end

	it "should not get someone mentioning themselves" do
		@madelyn.mentioned_by.include?(@madelyn).should_not be_true
	end

	it "should have first degree connections made" do
		@madelyn.first_degree_connections.include?(@magali).should be_true
	end

end