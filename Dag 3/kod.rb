# List of input, formatted in string for every row.
input = File.read(Dir.pwd + '/input.in').split("\n")

# Code for star one
def star_one(input)
  per_row = 3
  hits = 0
  input.each_with_index do |line, row|
    # move 3x while wrapping around
    position = row * per_row % line.length

    # check hit
    hits += 1 if line.split('')[position] === '#'
  end
  hits
end

# Code for star two
def star_two(input)
  movement = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

  all_hits = 1

  movement.each do |move|
    right = move[0]
    down = move[1]
    hits = 0
    pos = 0
    row = 0
    while row < input.length
      hits += 1 if input[row].split('')[pos % input[row].length] == '#'
      row += down
      pos += right
    end

    puts "case #{move}: #{hits}"
    all_hits *= hits
  end
  puts all_hits
end

star_two(input)
