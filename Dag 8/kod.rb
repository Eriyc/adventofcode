require 'set'

class Interpreter
  def initialize(instructions)
    @instructions = instructions
  end

  def run
    accumulator = 0
    offset = 0
    visited = Set.new

    while true
      return [accumulator, true] if offset >= @instructions.size

      instruction, value = @instructions[offset]
      case instruction
      when 'nop'; offset += 1
      when 'acc'; accumulator += value; offset += 1
      when 'jmp'; offset += value
      end

      return [accumulator, false] if visited.include?(offset)
      visited.add(offset)
    end
  end
end

instructions = File.read('input.in').lines(chomp: true).map { |l| i, v = l.split(' '); [i, v.to_i] }
interpreter = Interpreter.new(instructions)

# part 1
puts Interpreter.new(instructions).run[0]

# part 2
(0...instructions.size).each do |change|
  saved = instructions[change][0]
  next if saved == 'acc'

  instructions[change][0] = saved == 'jmp' ? 'nop' : 'jmp'
  accumulator, halted = interpreter.run
  puts accumulator if halted

  instructions[change][0] = saved
end