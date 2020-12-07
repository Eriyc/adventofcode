# Code for star one
def star_one
  bags = {}
  File.read('input.in').lines(chomp: true).each do |line|
  pre, post = line.gsub('.', '').gsub(/ bags?/, '').split(' contain ')
    bags[pre] = post.split(',').map { |t| count, bag = t.split(' ', 2); [count.to_i, bag] }
  end

  def search(bags, bag)
    return 0 unless bags.has_key?(bag)
    return 1 if bags[bag].any? { |_c, b| b == 'shiny gold' }

    bags[bag].each do |_c, b|
      return 1 if search(bags, b) == 1
    end
    0
  end

  puts bags.map { |bag, _contains| search(bags, bag) }.sum
end

# Code for star two
def star_two
  bags = {}
  File.read('input.in').lines(chomp: true).each do |line|
    pre, post = line.gsub('.', '').gsub(/ bags?/, '').split(' contain ')
    bags[pre] = if post.include?('no other')
                  []
                else
                  post.split(',').map { |t| count, bag = t.split(' ', 2); [count.to_i, bag] }
                end
  end

  def append(bags, current_bag, out, mult = 1)
    return if bags[current_bag].empty?

    bags[current_bag].each do |c, b|
      out[b] ||= 0
      out[b] += c * mult
      append(bags, b, out, c * mult)
    end
  end

  out = {}
  append(bags, 'shiny gold', out)
  puts out.values.sum
end

start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
star_one
finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
star_two
diff = finish - start # gets time is seconds as a float
puts diff