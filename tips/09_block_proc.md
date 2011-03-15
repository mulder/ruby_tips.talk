!SLIDE bullets
# 9 #
## Proc.new ##

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
	
!SLIDE

	@@@ ruby

	class Magic
	
		def self.dsl(*args)
			# ....
			Proc.new(self.new) if block_given?
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

	
	