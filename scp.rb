require 'parallel'

dest = ['root@157.230.45.162', 'root@157.230.41.211', 'root@68.183.191.242',
        'root@157.230.246.61', 'root@68.183.139.78', 'root@157.230.237.97',
        'z0rk1@34.73.12.44',]
file = '/home/z0rk1/Загрузки/cminer-linux4/cminer-0.1.0-beta.2-linux4-amd64/'

Parallel.each(dest, in_processes: dest.size) do |d|
  puts "Copying #{file} to #{d} \n"
  system "scp -r #{file} #{d}:."
end
