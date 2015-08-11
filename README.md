# Diving in ruby optimization

## gsub and tr with frozen arguments

In `gsub_tr_freeze_benchmark.rb` we compare `tr` and `gsub` methods with frozen arguments.

~~~bash
Original string: Hello world

gsub('l', 'p')               => Heppo worpd
gsub('l'.freeze, 'p'.freeze) => Heppo worpd
tr('l', 'p')                 => Heppo worpd
tr('l'.freeze, 'p'.freeze)   => Heppo worpd

Number of calls: 1000000
                   user     system      total        real
gsub           1.030000   0.000000   1.030000 (  1.034432 )
gsub_freeze    0.910000   0.000000   0.910000 (  0.902504 )
tr             0.350000   0.000000   0.350000 (  0.349899 )
tr_freeze      0.240000   0.000000   0.240000 (  0.242173 )

Number of calls: 5000000
                   user     system      total        real
gsub           5.120000   0.000000   5.120000 (  5.103320 )
gsub_freeze    4.480000   0.000000   4.480000 (  4.471240 )
tr             1.750000   0.000000   1.750000 (  1.751402 )
tr_freeze      1.200000   0.000000   1.200000 (  1.196852 )


Hello world
# string.gsub!('l'.freeze, 'p'.freeze)
# string.gsub!('p', 'u')
Heuuo worud
~~~

The `'p'.freeze` doesn't freeze the character in the string,
it only allow to not read the character again and again, it simply read from the memory.
