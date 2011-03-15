!SLIDE bullets
# 1 #
## public, protected & private ##

!SLIDE
## Explicit vs Implicit method calls ##
	@@@ ruby

	class Foo
		attr_reader :bar
		
		def baz
			self.bar #explicit
		end
		
		def thud
			bar #implicit
		end
	end
	
	foo = Foo.new
	foo.bar  #explicit

!SLIDE bullets incremental

# public #

## receiver of the message may be either: ##

* explicit: foo.bar or self.bar
* implicit: bar
	

!SLIDE bullets incremental

# protected #

## receiver must be self or the same class as self

* explicit: self.bar
* implicit: bar
* class FooBar < Foo

!SLIDE bullets incremental

# private #

## receiver must be invoked on self, but only with an implicit receiver ##

* implicit: bar
* class FooBar < Foo