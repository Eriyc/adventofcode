input = File.read(Dir.pwd + "/input.in").split("\n")

for num in input do
    numbers = input.select { |line| line.to_i + num.to_i < 2020}
    numbers.each do |num2|
        numbers2 = input.select { |line| line.to_i + num.to_i + num2.to_i === 2020}
        numbers2.each do |num3|
            if num3.to_i + num.to_i + num2.to_i === 2020
                puts "#{num} #{num2} #{num3}"
                puts 798 * 664 * 558
            end
        end
    end
end
