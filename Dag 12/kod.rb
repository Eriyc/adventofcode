# part one
current_dir = 'E'
current_pos = [0, 0]
input = File.read('input.in').lines(chomp: true).each do |instruction|
  dir = instruction[0]
  size = instruction[1..].to_i
  dir = current_dir if dir == 'F'

  case dir
  when 'N'; current_pos[1] += size
  when 'S'; current_pos[1] -= size
  when 'E'; current_pos[0] += size
  when 'W'; current_pos[0] -= size
  when 'L';
    order = ['N', 'W', 'S', 'E']
    current_dir = order[(order.index(current_dir) + size / 90) % order.size]
  when 'R';
    order = ['N', 'E', 'S', 'W']
    current_dir = order[(order.index(current_dir) + size / 90) % order.size]
  end
end

puts current_pos.map(&:abs).sum


# part two
current_pos = [0, 0]
waypoint_offset = [10, 1]
File.read('input.in').lines(chomp: true).each do |instruction|
  dir = instruction[0]
  size = instruction[1..].to_i

  case dir
  when 'N'; waypoint_offset[1] += size
  when 'S'; waypoint_offset[1] -= size
  when 'E'; waypoint_offset[0] += size
  when 'W'; waypoint_offset[0] -= size
  when 'L';
    case size
    when 90; waypoint_offset = [ -1 * waypoint_offset[1], waypoint_offset[0] ]
    when 180; waypoint_offset = [ -1 * waypoint_offset[0], -1 * waypoint_offset[1] ]
    when 270; waypoint_offset = [ waypoint_offset[1], -1 * waypoint_offset[0] ]
    end
  when 'R';
    case size
    when 90; waypoint_offset = [ waypoint_offset[1], -1 * waypoint_offset[0] ]
    when 180; waypoint_offset = [ -1 * waypoint_offset[0], -1 * waypoint_offset[1] ]
    when 270; waypoint_offset = [ -1 * waypoint_offset[1], waypoint_offset[0] ]
    end
  when 'F'; current_pos = [ current_pos[0] + waypoint_offset[0] * size, current_pos[1] + waypoint_offset[1] * size ]
  end
end

puts current_pos.map(&:abs).sum
