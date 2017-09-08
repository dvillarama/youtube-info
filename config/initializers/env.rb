require 'dotenv'
require 'yt'

Dotenv.load

Yt.configuration.api_key = ENV['YOUTUBE_API_KEY']
