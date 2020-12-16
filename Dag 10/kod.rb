start = Process.clock_gettime(Process::CLOCK_MONOTONIC)

# ta input från argv[0]
data = $<.map(&:to_i).sort

# första är 1
diff_of_one = diff_of_three = 1
data.each_cons(2) do |x, y|
  case y - x
  when 1
    diff_of_one += 1
  when 3
    diff_of_three += 1
  end
end
# p diff_of_one * diff_of_three

# första är 1
arrangements = { 0 => 1 }
data.each do |x|
  arrangements[x] = ([arrangements[x - 1], arrangements[x - 2], arrangements[x - 3]] - [nil]).sum
end
p arrangements.values.last
# p ([19] - [nil]).sum
finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
diff = finish - start # gets time is seconds as a float
puts "Execution time: #{diff}s"