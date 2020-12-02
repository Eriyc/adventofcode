def one
    valid = []

    input = File.read(Dir.pwd + "/input.in").split("\n").map do |line|
        data = line.split
        spec = data[0].split('-')
        min = spec[0].to_i
        max = spec[1].to_i

        letter = data[1][0]
        password = data[2]

        iterator = 0
        password.split('').each do |l|
            l == letter && iterator += 1
        end
        if iterator <= max && iterator >= min
            valid.push(password)
        end 
    end
    p "\n#{valid.length}"
end

def two 
    valid = []

    input = File.read(Dir.pwd + "/input.in").split("\n").map do |line|
        data = line.split
        spec = data[0].split('-')
        pos1 = spec[0].to_i
        pos2 = spec[1].to_i

        letter = data[1][0]
        password = data[2]

        occurances = 0
        if password[pos1-1] == letter
            if password[pos2-1] != letter
                valid.push(password)
            end
        elsif (password[pos2-1] == letter)
            valid.push(password)
        end
 
    end
    puts "\n #{valid.length}"
end

two()