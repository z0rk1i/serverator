require 'nokogiri'
require 'open-uri'
require 'ap'
require 'json'

while true do
  puts Time.now.to_s
  puts '=' * 26
  doc = Nokogiri::HTML(open('http://testnet2.quarkchain.io/getFullStats'))
  JSON.parse(doc)['shards'].last(4).each do |shard|
    ap "#{shard['fullShardId']} => #{shard['difficulty']}"
  end
  puts '-' * 26
  sleep 60
end
