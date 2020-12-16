strs = File.read(Dir.pwd + '/input.in').split("\n")
id = strs[0].to_i

buses = strs[1].split(',').map(&:to_i).select { |x| x > 0 }
delays = buses.map do |bus_id|
  bus_id - (id % bus_id)
end

delay = delays.min
answer = buses[delays.index(delay)]

puts "Del 1: #{answer * delay}"

buses = strs[1].split(',').map(&:to_i)
               .map.with_index { |n, x| [n, x] }
               .select { |n, _| n > 0 }
t = 0
prod = 1
buses.each do |bus_id, delay|
  t += prod while (t + delay) % bus_id != 0

  prod *= bus_id
end

puts "Del 2: #{t}"
