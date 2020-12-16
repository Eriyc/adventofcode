# Input file to list
input = File.read(Dir.pwd + '/input.in').split("\n")

def dec2bin(number)
    number = Integer(number)
    if(number == 0) then 0 end
        
    ret_bin = ""
    while(number != 0)
        ret_bin = String(number % 2) + ret_bin
        number = number / 2
    end
    ret_bin
end

# Code for star one
def star_one(input)
  mem = {}
  mask = ''
  input.each do |v|
    if v.start_with?('mask =')
      mask = (v.split(' = ')[1])
    else
      addr, val = v.split(' = ')
      addr = addr[4..-1].to_i
      
      val =  val.to_i
      bits = ('%036b' % val).split('')
      bitsn = [0] * 36
      mask.split('').zip(bits).each_with_index do |(mbit, abit), i|
        if mbit == 'X'
          bitsn[i] = abit
        else
          bitsn[1] = mbit
        end
      end
      mem[addr] = bitsn.join.to_i(2)
      p mem[addr]
    end
  end
  p mem.values.sum
end

# Code for star two
def star_two; end

star_one(input)
puts star_two
