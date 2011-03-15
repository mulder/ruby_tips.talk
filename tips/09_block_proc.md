!SLIDE bullets
# 9 #
## Proc.new ##

!SLIDE

	@@@ ruby	
	
	Magic.dsl do |dsl|
		dsl.foo(:a)
		
		dsl.bar(1,2,3)
	end

!SLIDE

	@@@ ruby
	
	class Magic
	
		def self.dsl(*args, &block)
			# ....
			block.call(self.new) if block
			# ....
		end
	
		def foo(*args)
			# ...
		end
		
		def bar(*args)
			# ...
		end
	
	end
	
	
!SLIDE

	@@@ ruby	
	
	Magic.dsl do |dsl|
		dsl.foo(:a)
		
		dsl.bar(1,2,3)
	end
	
	# Maybe you call your dsl like this too...
	Magic.dsl(:foo => [...], :bar => [...])	
	
!SLIDE

	@@@ ruby

	class Magic
	
		def self.std_block(*args, &block)
		  block.call(self.new) unless block.nil?
		end
    
		def self.proc_new(*args)
		  Proc.new.call(self.new) if block_given?
		end

		# keeping the same foo and bar methods... 
	end
	
!SLIDE

	@@@ ruby
	n = 1000000
	Benchmark.bm(20) do |x|
	  x.report("Magic with std_block") do
	    n.times do
	      Magic.std_block do |dsl|
	        dsl.foo
	        dsl.bar
	      end
	    end
	  end
	  x.report("Magic with proc_new ") do
	    n.times do
	      Magic.proc_new do |dsl|
	        dsl.foo
	        dsl.bar
	      end
	    end
	  end
	end
	
	
!SLIDE

	                          user     system      total        real
	Magic with std_block  1.680000   0.000000   1.680000 (  1.671222)
	Magic with proc_new   1.730000   0.010000   1.740000 (  1.733817)

	
	