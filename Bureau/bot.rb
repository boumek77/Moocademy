#! / usr / bin / env ruby
require 'twitter'
require        'rubygems'

client = Twitter :: REST :: Client.new do |config|
	

  config.consumer_key = "5ACWcojarpYri6oLQPUAS2tta"
  config.consumer_secret = "daEz9GN2WzQ2qOrciQTNW6eDgjMN3CrrmMeId8Fx1zBLtTk1zv"
  config.access_token = "918077925571874819-GCbGfq1eLGbpT6A2MC12I8rUbMvyLEA"
  config.access_token_secret = "918077925571874819"
end
	

client.update('hello!')
