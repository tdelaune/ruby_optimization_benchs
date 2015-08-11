require 'benchmark'

string = "Hello world"

puts "Original string: #{string}\n\n"

puts "gsub('l', 'p')               => #{string.gsub('l', 'p')}"
puts "gsub('l'.freeze, 'p'.freeze) => #{string.gsub('l'.freeze, 'p'.freeze)}"
puts "tr('l', 'p')                 => #{string.tr('l', 'p')}"
puts "tr('l'.freeze, 'p'.freeze)   => #{string.tr('l'.freeze, 'p'.freeze)}"

n = 1000000
puts "\nNumber of calls: #{n}\n"

Benchmark.bm(12) do |x|
  x.report("gsub") { n.times { string.gsub('l', 'p') } }
  x.report("gsub_freeze") { n.times { string.gsub('l'.freeze, 'p'.freeze) } }
  x.report("tr") { n.times { string.tr('l', 'p') } }
  x.report("tr_freeze") { n.times { string.tr('l'.freeze, 'p'.freeze) } }
end

n = 5000000
puts "\nNumber of calls: #{n}\n"

Benchmark.bm(12) do |x|
  x.report("gsub") { n.times { string.gsub('l', 'p') } }
  x.report("gsub_freeze") { n.times { string.gsub('l'.freeze, 'p'.freeze) } }
  x.report("tr") { n.times { string.tr('l', 'p') } }
  x.report("tr_freeze") { n.times { string.tr('l'.freeze, 'p'.freeze) } }
end

# Character have not been frozen
puts "\n#{string}"

string.gsub!('l'.freeze, 'p'.freeze)
string.gsub!('p', 'u')

puts string
