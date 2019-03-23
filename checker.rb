require 'nokogiri'
require 'open-uri'
require 'ap'
require 'json'

doc = Nokogiri::HTML(open('http://testnet2.quarkchain.io/getFullStats'))

JSON.parse(doc)['shards'].last(2).each do |shard|
  ap "#{shard['fullShardId']} => #{shard['difficulty']}"
end
