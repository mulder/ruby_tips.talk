!SLIDE bullets
# 8 #
## Benchmarking ##

!SLIDE

## STDLIB Benchmark Usage ##

	@@@ ruby

	require 'benchmark'

	Benchmark.bm do |x|
	  # Benchmark magic here...
	end


!SLIDE

## Benchmark block ##
	@@@ ruby

	require 'benchmark'
	
	title_offset = 20 

	Benchmark.bm(title_offset) do |x|
	  x.report('Title of your report') do
			# Thing you want to benchmark
		end
	end

!SLIDE

## Benchmark many times for better results! ##
	@@@ ruby

	require 'benchmark'
	
	title_offset = 20 

	Benchmark.bm(title_offset) do |x|
	  x.report('Title of your report') do
			1000.times do
				# Thing you want to benchmark
			end
		end
	end

	
!SLIDE

## Compare symbol2proc vs standard block ##

	@@@ ruby
	
	(1..10).to_a.map {|i| i.to_s }
	
## vs ##

	@@@ ruby
	(1..10).to_a.map(&:to_s)

	
	
!SLIDE

## Full benchmark script ##

	@@@ ruby
	require 'benchmark'
	Benchmark.bm(42) do |x|
	  [1000, 10000, 100000].each do |n|
	    x.report("Array from 1 to #{n.to_s.rjust(8, ' ')} with block      ") do
	      100.times do
	        (1..n).to_a.map {|i| i.to_s }
	      end
	    end

	    x.report("Array from 1 to #{n.to_s.rjust(8, ' ')} with symbol2proc") do
	      100.times do
	        (1..n).to_a.map(&:to_s)
	      end
	    end
	  end

	end	

!SLIDE

## Output ##


	Symbol to Proc vs regular block
	                                     user     system      total      real
	1 to     1000 with block         0.040000   0.000000   0.040000 (0.041945)
	1 to     1000 with symbol2proc   0.030000   0.000000   0.030000 (0.030246)
	1 to    10000 with block         0.370000   0.000000   0.370000 (0.366541)
	1 to    10000 with symbol2proc   0.320000   0.000000   0.320000 (0.322752)
	1 to   100000 with block         3.380000   0.100000   3.480000 (3.472201)
	1 to   100000 with symbol2proc   2.930000   0.100000   3.030000 (3.020436)

!SLIDE

## inject vs each_with_object ##

	@@@ ruby
	require 'active_support/core_ext/enumerable'
	Benchmark.bm(42) do |x|
	  [1000, 10000, 100000].each do |n|
	    x.report("Sum from 1 to #{n.to_s.rjust(8, ' ')} with inject          ") do
	      100.times do
	        (1..n).to_a.inject(0) {|sum, i| sum += i}
	      end
	    end

	    x.report("Sum from 1 to #{n.to_s.rjust(8, ' ')} with each_with_object") do
	      100.times do
	        (1..n).to_a.each_with_object(0) {|i, sum| sum += i}
	      end
	    end
	  end

	end


!SLIDE

## Output ##

	each_with_object vs inject
	                                       user    system     total      real
	1 to   1000 with inject            0.020000  0.000000  0.020000 (0.020586)
	1 to   1000 with each_with_object  0.020000  0.000000  0.020000 (0.018928)
	1 to  10000 with inject            0.180000  0.000000  0.180000 (0.182595)
	1 to  10000 with each_with_object  0.170000  0.000000  0.170000 (0.172993)
	1 to 100000 with inject            1.710000  0.050000  1.760000 (1.754776)
	1 to 100000 with each_with_object  1.720000  0.060000  1.780000 (1.775584)