class Foo

  private
    def bar
      'success'
    end

  public
    def baz
      self.bar
    end

    def qux
      bar
    end
end

begin
  puts Foo.new.bar # Throws error
rescue NoMethodError
  puts "No Method error on explicit call from outside of Foo"
end

begin
  puts Foo.new.baz # Throws error
rescue NoMethodError
  puts "No Method error on explicit call from inside of Foo"
end

puts Foo.new.qux + " on implicit call from inside of Foo"
