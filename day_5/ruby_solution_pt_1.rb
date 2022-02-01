require 'pry'

agg_array = []

File.foreach('day_5/input.txt') do |line|
  coor_array = []
  line_split = line.chomp.split(" -> ")
  line_split.each do |pair|
    coor_array.push(pair.split(","))
  end

  if coor_array[0][0] == coor_array[1][0]
    y_array = [coor_array[0][1], coor_array[1][1]].sort
    new_y = ((y_array[0].to_i + 1)...y_array[1].to_i).to_a
    new_y.each do |y|
      new_pair = [coor_array[0][0], y.to_s]
      coor_array.push(new_pair)
    end 
    agg_array.push(coor_array)
  elsif coor_array[0][1] == coor_array[1][1]
    x_array = [coor_array[0][0], coor_array[1][0]].sort
    new_x = ((x_array[0].to_i + 1)...x_array[1].to_i).to_a
    new_x.each do |x|
      new_pair = [x.to_s, coor_array[0][1]]
      coor_array.push(new_pair)
    end 
    agg_array.push(coor_array)
  # else 
  #   agg_array.push(coor_array)
  end  
end 

coor_dict = {}

agg_array.each do |coor_set|
  coor_set.each do |coor_pair|
    if coor_dict[coor_pair]
      coor_dict[coor_pair] += 1
    else 
      coor_dict[coor_pair] = 1
    end 
  end 
end 

a = coor_dict.select do |key,value|
  value >= 2
end 

puts a.count