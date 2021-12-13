agg_depth_array = []

agg_depth = 0

count = -1

depth_scan_array = []

File.foreach('day_1/input.txt') do |line|
  if depth_scan_array.length <= 2
    depth_scan_array.push(line.chomp.to_i)
  else 
    agg_depth_array.push(depth_scan_array.sum)
    depth_scan_array.shift
    depth_scan_array.push(line.chomp.to_i)
  end 
end 

agg_depth_array.push(depth_scan_array.sum)

agg_depth_array.each do |current_depth_agg|
  count += 1 if current_depth_agg > agg_depth
  agg_depth = current_depth_agg
end 

puts count