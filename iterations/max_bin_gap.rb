require 'benchmark'
TEST_N_VALUES = [0, 592, 20, 15, 262153, 2145386752]

# ITERATIVE METHOD
def max_bin_gap_while(n)
  return 0 if n == 0

  gaps = []
  gap  = 0

  while n > 0
    if n % 2 == 0
      gap += 1
    else
      gaps.push(gap)
      gap = 0
    end

    n /= 2
  end

  gaps.max
end

# RECURSIVE METHOD
def max_bin_gap_rec(n)
  return 0 if n == 0
  bin_gap(n.to_s(2).split('').map(&:to_i))
end

def bin_gap(bin_n)
  return 0 unless bin_n

  gap = 0

  bin_n.each do |bit|
    bit == 0 ? gap += 1 : break
  end

  next_gap = bin_gap(bin_n[gap+1..-1])

  gap > next_gap ? gap : next_gap
end

# TESTS

def run_all_tests
  puts "Recursive:"
  test_max_bin_gap_rec
  puts "Iterative:"
  test_max_bin_gap_while
  test_time
end

def test_max_bin_gap_while
  TEST_N_VALUES.each do |n|
    puts "n: #{n} bin: #{n.to_s(2)} gap: #{max_bin_gap_while(n)}"
  end
end

def test_max_bin_gap_rec
  TEST_N_VALUES.each do |n|
    puts "n: #{n} bin: #{n.to_s(2)} gap: #{max_bin_gap_rec(n)}"
  end
end

def test_time
 time_rec = Benchmark.measure {
  10000.times{
    TEST_N_VALUES.each{ |n| max_bin_gap_rec(n) }
  }
 }

 time_it = Benchmark.measure {
  10000.times{
    TEST_N_VALUES.each{ |n| max_bin_gap_while(n) }
  }
 }

 puts "Recursive: #{time_rec.real}s"
 puts "Iterative: #{time_it.real}s"
end
