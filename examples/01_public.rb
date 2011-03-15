class Foo

  def bar
    'success'
  end

  def baz
    self.bar
  end

  def qux
    bar
  end
end

puts Foo.new.bar + " on explicit call from outside of Foo"
puts Foo.new.baz + " on explicit call from inside of Foo"
puts Foo.new.qux + " on implicit call from inside of Foo"
