require "rubygems"
require "twitter"

class TwitterApi
	def self.set_client
		@client ||= Twitter::REST::Client.new do |config|
			puts "Configuring Twitter access token..."
			config.consumer_key = ENV['DB_CONSUMER_KEY']
			config.consumer_secret = ENV['DB_CONSUMER_SECRET']
			config.access_token =  ENV['DB_ACCESS_TOKEN']
			config.access_token_secret = ENV['DB_ACCESS_SECRET']
		end
	end

	def self.set_stream_client
		@client ||= Twitter::Streaming::Client.new do |config|
			puts "Configuring Twitter access token..."
			config.consumer_key = ENV['DB_CONSUMER_KEY']
			config.consumer_secret = ENV['DB_CONSUMER_SECRET']
			config.access_token =  ENV['DB_ACCESS_TOKEN']
			config.access_token_secret = ENV['DB_ACCESS_SECRET']
		end
	end
end