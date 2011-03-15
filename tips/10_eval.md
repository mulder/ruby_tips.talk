!SLIDE bullets
# 10 #
## eval != evil ##

!SLIDE bullets

* eval
* class_eval
* instance_eval

!SLIDE

	@@@ ruby

	class Magic

		def self.dsl(*args)
			# Proc.new.call(self.new) if block_given?  # Old version

			# ....
			self.new.instance_eval(&Proc.new) if block_given?
			# ....
		end

		# ....
	end
	
	Magic.dsl do
	  foo(:a)
	  bar(1,2,3)
	end