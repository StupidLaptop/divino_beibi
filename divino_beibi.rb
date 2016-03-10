require "rubygems"
require "twitter"
#require 'twitter_api.rb'

	@rest_client ||= Twitter::REST::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = ENV['DB_CONSUMER_KEY']
		config.consumer_secret = ENV['DB_CONSUMER_SECRET']
		config.access_token =  ENV['DB_ACCESS_TOKEN']
		config.access_token_secret = ENV['DB_ACCESS_TOKEN_SECRET']
	end

	stream_client ||= Twitter::Streaming::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = ENV['DB_CONSUMER_KEY']
		config.consumer_secret = ENV['DB_CONSUMER_SECRET']
		config.access_token =  ENV['DB_ACCESS_TOKEN']
		config.access_token_secret = ENV['DB_ACCESS_TOKEN_SECRET']
	end	

 	def baloto_num
 		result = []
 		until result.length == 6 do
 			new_num = (rand(44) + 1)
 			unless result.include? new_num
 				result.push(new_num) 
 			end 
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
 	