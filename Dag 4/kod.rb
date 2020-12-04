# Input file to list
input = File.read(File.dirname(__FILE__) + '/input.in')

# Code for star one
def star_one(input)
  keys = %w[byr iyr eyr hgt hcl ecl pid cid]
  # split at empty rwo
  count = input.split("\n\n").count do |passport|
    passport = passport.split.map { |s| s.split(':') }.sort.to_h
    (keys - passport.keys).empty? || (keys - passport.keys) == ['cid']
  end
  count
end

# Code for star two
def star_two(input)
  count = input.split("\n\n").count do |passport|
    passport = passport.split.map { |s| s.split(':') }.sort.to_h

    next unless (1920..2002).cover?(passport['byr'].to_i)
    next unless (2010..2020).cover?(passport['iyr'].to_i)
    next unless (2020..2030).cover?(passport['eyr'].to_i)

    m = (passport['hgt'] || '').match(/^(\d+)(cm|in)$/)
    next unless m

    d = Regexp.last_match(1).to_i
    u = Regexp.last_match(2)
    case u
    when 'cm' then next unless (150..193).cover?(d)
    when 'in' then next unless (59..76).cover?(d)
    end

    # hair color: #[9 letters or numbers]
    next if passport['hcl'] !~ /^#[0-9a-f]{6}$/
    # eye color: [one of following]
    next if passport['ecl'] !~ /^(amb|blu|brn|gry|grn|hzl|oth)$/
    # password id: [9 digits]
    next if passport['pid'] !~ /^\d{9}$/

    true
  end
  count
end

puts star_one(input)
puts star_two(input)
