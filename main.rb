require 'net/ssh'     #gem install net-ssh
require 'parallel'    #gem install parallel
require 'ap'
require 'smarter_csv' #gem install smarter_csv
require 'csv'
require 'json'


clusters = ['root@68.183.191.242', 'root@68.183.139.78']
workers = SmarterCSV.process('workers.csv')

def grep_process(x)

end

Parallel.each(workers, in_threads: workers.size) do |w|
  #unless w[:dockerid]
    Net::SSH.start(w[:ip], w[:name]) do |ssh|
      w[:dockerid] = ssh.exec!('sudo docker ps -lq').chop!
      w[:cpus] = ssh.exec!('nproc').chop!
      w[:current_shard] = ssh.exec!("ps axu | grep external_miner | awk '{ print $23}' | head -1").chop!
      ap w
    end
  #end
end
ap workers
File.open("workers.json", "w") { |file| file.write workers.to_json }
