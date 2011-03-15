h = Hash.new([])

h[:a] << 1
h[:b] << 1

puts h[:a]
puts h[:a].object_id == h[:b].object_id  # true
puts h[:foo].object_id == h[:bar].object_id  # true

h = Hash.new {|h,k| h[k] = []}

h[:a] << 1
h[:b] << 1

puts h[:a].object_id == h[:b].object_id  # false
