def sort(column, direction = :desc)
  [column, direction].join(' ')
end


puts sort('name')
puts sort('name', :asc)

params = {:column => 'name', :direction => 'asc'}
puts sort(params[:column], params[:direction])

params = {:column => 'name'}
puts sort(params[:column], params[:direction])