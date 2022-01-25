agg_array = []

File.foreach('day_3/input.txt') do |line|
  line_string = line.chomp
  agg_array.push(line_string)
end 

def o_recursion(array, pos)
  return array[0] if array.length == 1

  zero = []
  one = []

  array.each do |element|
    if element[pos] == '0'
      zero.push(element)
    else 
      one.push(element)
    end
  end 

  if zero.length > one.length 
    o_recursion(zero, (pos + 1))
  else 
    o_recursion(one, (pos + 1))
  end 
end

def c_recursion(array, pos)
  return array[0] if array.length == 1

  zero = []
  one = []

  array.each do |element|
    if element[pos] == '0'
      zero << element
    else 
      one << element 
    end
  end 

  if one.length < zero.length 
    c_recursion(one, (pos + 1))
  else 
    c_recursion(zero, (pos + 1))
  end 
end

o_value = o_recursion(agg_array, 0)
c_value = c_recursion(agg_array, 0)

puts (o_value.to_i(2) * c_value.to_i(2))