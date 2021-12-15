horizontal_pos = 0

vertical_pos = 0

File.foreach('day_2/input.txt') do |line|
  new_array = line.chomp.split(' ')
  if new_array[0] == "forward"
    horizontal_pos += new_array[1].to_i
  elsif new_array[0] ==  "up"
    vertical_pos -= new_array[1].to_i
  else 
    vertical_pos += new_array[1].to_i
  end 
end 

puts (horizontal_pos * vertical_pos)