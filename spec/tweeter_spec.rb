require "./spec_helper"
describe "Tweeter" do
	before(:each) do 
		@tweeter = Tweetwork::Tweeter.new("AlBundy")
	end

	it "should have a username that's accessible" do 
		@tweeter.username.should eq("AlBundy")
	end
end