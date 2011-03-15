require 'benchmark'
require 'active_support/core_ext/enumerable'

puts "Symbol to Proc vs regular block"

Benchmark.bm(42) do |x|
  [1000, 10000, 100000].each do |n|
    x.report("Array from 1 to #{n.to_s.rjust(8, ' ')} with block      ") do
      100.times do
        (1..n).to_a.map {|i| i.to_s }
      end
    end

    x.report("Array from 1 to #{n.to_s.rjust(8, ' ')} with symbol2proc") do
      100.times do
        (1..n).to_a.map(&:to_s)
      end
    end
  end

end

puts "\n\neach_with_object vs inject"

Benchmark.bm(42) do |x|
  [1000, 10000, 100000].each do |n|
    x.report("Sum from 1 to #{n.to_s.rjust(8, ' ')} with inject          ") do
      100.times do
        (1..n).to_a.inject(0) {|sum, i| sum += i}
      end
    end

    x.report("Sum from 1 to #{n.to_s.rjust(8, ' ')} with each_with_object") do
      100.times do
        (1..n).to_a.each_with_object(0) {|i, sum| sum += i}
      end
    end
  end

end