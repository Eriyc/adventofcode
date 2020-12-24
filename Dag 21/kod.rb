# input
data = File.open('input.in')

# parse
foods = data.lines.map do |s|
  s =~ /(.*) \(contains (.*)\)/
  [Regexp.last_match(1).split, Regexp.last_match(2).split(', ')]
end
ingredients = foods.map(&:first).flatten.uniq.sort
allergens = foods.map { |f| f[1] }.flatten.uniq.sort

#
# part 1
#

# which ingredients can't contain an allergen?
invalid = ingredients.select do |i|
  # find potential allergens for this ingredient
  potential = foods.select { |is, _| is.include?(i) }.map { |f| f[1] }.flatten.uniq
  # are any of these allergens valid when we look at foods?
  potential.none? do |a|
    foods.all? { |is, as| !as.include?(a) || is.include?(i) }
  end
end

p foods.map(&:first).flatten.count { |i| invalid.include?(i) }

#
# part 2
#

# remove impossible from foods, then build rules of allergen => ingredients
foods = foods.map { |is, as| [is - invalid, as] }
ingredients = foods.map(&:first).flatten.uniq.sort
rules = foods.flat_map { |is, as| as.map { |a| [a, is] } }.sort

ingredients.permutation(allergens.length).each do |v|
  mapping = allergens.zip(v).to_h
  if rules.all? { |a, is| is.include?(mapping[a]) }
    p mapping.values.join(',')
    exit
  end
end
