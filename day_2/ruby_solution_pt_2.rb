horizontal_pos = 0

vertical_pos = 0

aim = 0

File.foreach('day_2/input.txt') do |line|
  new_array = line.chomp.split(' ')
  if new_array[0] == "forward"
    horizontal_pos += new_array[1].to_i
    vertical_pos += (aim*new_array[1].to_i)
  elsif new_array[0] ==  "up"
    aim -= new_array[1].to_i
  else 
    aim += new_array[1].to_i
  end 
end 

puts (horizontal_pos * vertical_pos)