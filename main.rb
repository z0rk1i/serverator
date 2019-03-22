require 'net/ssh'     #gem install net-ssh
require 'parallel'    #gem install parallel
require 'ap'
require 'smarter_csv' #gem install smarter_csv
require 'csv'

clusters = ['root@68.183.191.242', 'root@68.183.139.78']
workers = SmarterCSV.process('workers.csv')

Parallel.each(workers, in_threads: workers.size) do |w|
  unless w[:dockerid]
    Net::SSH.start(w[:ip], w[:name]) do |ssh|
      cmd = 'sudo docker ps -lq'
      w[:dockerid] = ssh.exec!(cmd).chop!
      ap w
    end
  end
end
ap workers
