count = -1

depth = 0

File.foreach('day_1/input.txt') do |line|
  count += 1 if line.chomp.to_i > depth 
  depth = line.chomp.to_i
end 

puts count