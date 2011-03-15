default_columns = [:name, :number, :status]
valid_columns = [:name, :number, :status, :date]

with = [:date, :foo]
except = [:status]


columns = ((default_columns | with) - except) & valid_columns
puts columns.inspect



only = [:date, :status]

columns = valid_columns & only
puts columns.inspect
