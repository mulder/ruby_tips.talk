!SLIDE bullets
# 2 #
## Optional Parameters ##

!SLIDE 

	@@@ ruby
	
	def sort(column, direction = :desc)
		order [column, direction].join(' ')
	end
	
!SLIDE

	@@@ ruby
	
	def index
		@models = ModelClass.sort(:name)          # order('name desc')
		@models = ModelClass.sort(:name, :asc)    # order('name asc')
	end
	
!SLIDE

	@@@ ruby
	
	def index
		@models = ModelClass.sort(params[:column], params[:direction])
	end
	
!SLIDE bullets incremental left

## /model_class/index?column=name&direction=asc ##
* 		=> order('name asc')
* /model_class/index?column=name
* 		=> order('name ')

!SLIDE
	@@@ ruby

	def sort(column, direction = :desc)
		order [column, direction].join(' ')
	end

	@models = ModelClass.sort(params[:column], params[:direction])
	
!SLIDE
	@@@ ruby

	def sort(column, direction = :desc)
		order [column, direction].join(' ')
	end

	@models = ModelClass.sort(params[:column], params[:direction])

	@models = ModelClass.sort('name', nil)

!SLIDE
	@@@ ruby

	def sort(column, direction = :desc)
		order [column, direction].join(' ')
	end

	@models = ModelClass.sort(params[:column], params[:direction])

	@models = ModelClass.sort('name', nil)

	order ['name', nil].join(' ') => order('name ')
	
!SLIDE

	@@@ ruby
	
	def sort(column, direction = :desc)
		order [column, direction].join(' ')
	end
	
!SLIDE

	@@@ ruby

	def sort(column, direction = nil)
		order [column, direction || :desc].join(' ')
	end

	def sort(column, direction = nil)
		direction = :desc unless direction.present?
		order [column, direction].join(' ')
	end

	def sort(column, options = {})
		options.reverse_merge!(:direction => :desc)
		order [column, options[:direction]].join(' ')
	end