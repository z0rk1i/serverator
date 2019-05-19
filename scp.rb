require 'parallel'

dest = ['root@68.183.191.242']
file = '/home/z0rk1/Загрузки/cminer-0.2.0-beta.3-linux3-amd64/'

Parallel.each(dest, in_processes: dest.size) do |d|
  puts "Copying #{file} to #{d} \n"
  system "scp -r #{file} #{d}:."
end
