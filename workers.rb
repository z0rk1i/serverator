require 'ap'
require 'json'

workers = JSON.parse(File.read('workers.json'))
ap workers
