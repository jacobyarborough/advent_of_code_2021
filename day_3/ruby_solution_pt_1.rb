agg_array = []
gamma_binary = ''
epsilon_binary = ''

File.foreach('day_3/input.txt') do |line|
  line_array = line.chomp.split('')
  agg_array.push(line_array)
end 

transposed_array = agg_array.transpose

transposed_array.each do |element|
  ones = element.count('1')
  zeros = element.length - ones
  if ones > zeros 
    gamma_binary += '1'
    epsilon_binary += '0'
  else 
    gamma_binary += '0'
    epsilon_binary += '1'
  end 
end 

puts (gamma_binary.to_i(2) * epsilon_binary.to_i(2))


