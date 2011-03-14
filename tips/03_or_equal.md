!SLIDE bullets
# 3 #
## Or Assignment ##

!SLIDE

	@@@ ruby
	
	def connect(db_name, creds = {}, log_level = nil)
		self.db_name = db_name
		self.creds = creds
		self.log_level = log_level || :info
		
		connect!
	end

!SLIDE  bullets incremential

## What if you want log_level to be false or nil? ##

* 		false || :info
* 		=> :info
* 		Same with ||= ... 

!SLIDE 

	@@@ ruby
	
	# Better option this time is an options hash
	def connect(db_name, creds = {}, options = {})
		self.db_name = db_name
		self.creds = creds
		self.options = {:log_level => :info}.merge(options)
		
		connect!
	end