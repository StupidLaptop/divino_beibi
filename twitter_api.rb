require "rubygems"
require "twitter"

class TwitterApi
	def self.set_client
		@client ||= Twitter::REST::Client.new do |config|
			puts "Configuring Twitter access token..."
			config.consumer_key = "STgygIPatnnnFcjV8Jm4VpOrE"
			config.consumer_secret = "DqRUoiFfUratTM6GsTbkBIuqb1qfGLmOhzK2vUfSpgUt7EagLY"
			config.access_token =  "42649396-Y5EFwNsZJzxgKQ8l3fIfQzl1k687HdAcnR1xvUQcT"
			config.access_token_secret = "9lCaU63vJmUuW9nyDBl9qif0dR7d7ccrZnGua8uNBHIMs"
		end
	end

	def self.set_stream_client
		@client ||= Twitter::Streaming::Client.new do |config|
			puts "Configuring Twitter access token..."
			config.consumer_key = "STgygIPatnnnFcjV8Jm4VpOrE"
			config.consumer_secret = "DqRUoiFfUratTM6GsTbkBIuqb1qfGLmOhzK2vUfSpgUt7EagLY"
			config.access_token = "42649396-Y5EFwNsZJzxgKQ8l3fIfQzl1k687HdAcnR1xvUQcT"
			config.access_token_secret = "9lCaU63vJmUuW9nyDBl9qif0dR7d7ccrZnGua8uNBHIMs"
		end
	end
end