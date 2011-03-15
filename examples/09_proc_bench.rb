require 'benchmark'

class Magic

  def self.std_block(*args, &block)
    block.call(self.new) unless block.nil?
  end

  def self.proc_new(*args)
    Proc.new.call(self.new) if block_given?
  end

  def foo(*args)
    :foo
  end

  def bar(*args)
    :bar
  end

end

Magic.std_block do |dsl|
  puts dsl.foo
  puts dsl.bar
end

Magic.proc_new do |dsl|
  puts dsl.foo
  puts dsl.bar
end

n = 1000000

Benchmark.bm(20) do |x|
  x.report("Magic with std_block") do
    n.times do
      Magic.std_block do |dsl|
        dsl.foo
        dsl.bar
      end
    end
  end

  x.report("Magic with proc_new ") do
    n.times do
      Magic.proc_new do |dsl|
        dsl.foo
        dsl.bar
      end
    end
  end
end
