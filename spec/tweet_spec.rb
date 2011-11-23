require "./spec_helper"
describe "Tweet" do
	before(:each) do 
		@network = Tweetwork::Network.new("../sample_input.rb")
		@tweet_text = "bob: 'They impress us ever with the conviction that one nature wrote and the same reads.' /cc @alberta"
		@tweet = Tweetwork::Tweet.new(@tweet_text,@network)
		@tweetee = @network.tweeters[:alberta]
		@tweeter = @network.tweeters[:bob]
	end

	it "should have a body" do 
		@tweet.body.should eq(" 'They impress us ever with the conviction that one nature wrote and the same reads.' /cc @alberta".strip)
	end

	it "should know it's username" do 
		@tweet.username.to_s.should eq("bob")
	end

	it "should know it's mentioned users" do
		@tweet.mentions.include?(@tweetee).should be_true
	end

	it "should add the tweeter to the tweetees mentioned by" do
		@tweetee.mentioned_by.include?(@tweeter).should be_true
	end
end