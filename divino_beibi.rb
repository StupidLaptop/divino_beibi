require "rubygems"
require "twitter"
#require 'twitter_api.rb'

	@rest_client ||= Twitter::REST::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = "sybEE9SSBFatGLFXC54UakwoN"
		config.consumer_secret = "nh8npSVSTFbRe4USgBly88EQlNVBo5j18ERsotOUC4njoMQ8ze"
		config.access_token =  "707898380144529409-wNZwn9EsOGjPZfsfrAXp6i66UXuYlJm"
		config.access_token_secret = "RJSfgrsgxiJ4qxHa4DmgiULK6E1LEvzQHT0oyvP6d6TUL"
	end

	stream_client ||= Twitter::Streaming::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = "sybEE9SSBFatGLFXC54UakwoN"
		config.consumer_secret = "nh8npSVSTFbRe4USgBly88EQlNVBo5j18ERsotOUC4njoMQ8ze"
		config.access_token =  "707898380144529409-wNZwn9EsOGjPZfsfrAXp6i66UXuYlJm"
		config.access_token_secret = "RJSfgrsgxiJ4qxHa4DmgiULK6E1LEvzQHT0oyvP6d6TUL"
	end	

 	def baloto_num
 		result = []
 		6.times do
 			result.push(rand(45)) 
 		end
 		result.sort!
 		return result.join(", ").to_s
 	end

 	def tweet_it(tweet)
 		@rest_client.update(tweet)
 	end

	hashtag = "#AyudameConElBaloto"
	stream_client.filter(track: hashtag) do |object|
		result = baloto_num
		reply_to = object.user.screen_name
		reply_tweet = "Con mucho gusto, @#{reply_to}. Los números para tí son: #{result}. !Buena suerte!"
 		tweet_it(reply_tweet) if object.is_a?(Twitter::Tweet)
 		puts "@#{object.user.screen_name}#{object.text}" if object.is_a?(Twitter::Tweet)
 		puts "@#{object.user.screen_name}#{object.text}".length
 	end
 	