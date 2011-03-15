!SLIDE bullets
# 6 #
## Array Operators ##

!SLIDE

## Array +/- operators ##

	@@@ ruby
	a = [1,2,3]
	b = [3,4,5]

	a + b == [1,2,3,3,4,5]
	a - b == [1,2]

!SLIDE

## Array Intersection and Union ##

	@@@ ruby
	a = [1,2,3]
	b = [3,4,5]

	a | b == [1,2,3,4,5]  # Union
	a & b == [3]          # Intersection

!SLIDE

## Building Report with/except ##

	@@@ ruby
	
	build_report(@data_source,  :with => [:date, :sin_number], 
							 	:except => :status)
	

!SLIDE

	@@@ ruby

	def default_columns
		[:name, :number, :status]
	end
	
	def valid_columns
		[:name, :number, :status, :date]
	end

	def build_report(data_source, options = {})
		with   = Array(options[:with])
		except = Array(options[:except])

		columns = ((default_columns | with) - except) & valid_columns
		# columns = [:name, :number, :date]

		build!(data_source, columns)
	end

!SLIDE

## Building Report with/except/only ##

	@@@ ruby

	build_report(@data_source, :only => [:date, :status])
	
!SLIDE

	@@@ ruby

	def build_report(data_source, options = {})
		with   = Array(options[:with])
		except = Array(options[:except])
		only   = Array(options[:only])

		columns = if options[:only].present?
			valid_columns & only
		else
			((default_columns | with) - except) & valid_columns
		end

		# columns = [:status, :date]
		build!(data_source, columns)
	end