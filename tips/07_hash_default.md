!SLIDE bullets
# 7 #
## Hash Default ##

!SLIDE

	@@@ ruby
	
	h = Hash.new
	
	h[:a] += 1
	=> NoMethodError: undefined method `+' for nil:NilClass
	
!SLIDE

	@@@ ruby

	h = Hash.new(0)
	
	h[:a] += 1
	=> 1

	h[:a] += 1
	=> 2
	
	h[:b] += 1
	=> 1

!SLIDE

	@@@ ruby

	h = Hash.new([])
	
	h[:a] << 1
	=> [1]
	
	h[:a] << 2
	=> [1, 2]

!SLIDE

	@@@ ruby

	h[:b] << 1
	=> [1, 2, 1] # ??
	
	h[:a]
	=> [1, 2, 1] # ??
	
	h[:a].object_id == h[:b].object_id
	=> true  #???
	
	h[:foo].object_id == h[:bar].object_id
	=> true
	
!SLIDE

	@@@ ruby
	
	h = Hash.new {|h,k| h[k] = []}
	
	h[:a] << 1
	=> [1]
	
	h[:b] << 1
	=> [1]
	
	h[:a].object_id == h[:b].object_id
	=> false  # Yay!