!SLIDE bullets
# 5 #
## Array.wrap ##

!SLIDE

	@@@ ruby
	
	Array.wrap(1) == Array.wrap([1])
	
	Array(:foo) == Array([:foo])
	
	Array(nil) == []
	
!SLIDE

	@@@ ruby
	
	cache(data, [:key, :data, :segment], :ttl => 300)
	cache(data, :key_data_segment, :ttl => 300)
	
		
!SLIDE

	@@@ ruby

	def cache(data, key, options)
		key = Array(key).join('_')

		# ....
	end

