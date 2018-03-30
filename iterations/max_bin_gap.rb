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

def max_bin_gap_rec(n)
  return 0 if n == 0
  bin_gap(n.to_s(2).split(''))
end

def bin_gap(bin_n)
  return 0 unless bin_n

  gap = 0

  bin_n.each do |bit|
    if bit == '0'
      gap += 1
    else
      break;
    end
  end

  [gap, bin_gap(bin_n[gap+1..-1])].max
end

def test_max_bin_gap_while
  [0, 592, 20, 15, 262153].each do |n|
    puts "n: #{n} bin: #{n.to_s(2)} gap: #{max_bin_gap_while(n)}"
  end
end

def test_max_bin_gap_rec
  [0, 592, 20, 15, 262153].each do |n|
    puts "n: #{n} bin: #{n.to_s(2)} gap: #{max_bin_gap_rec(n)}"
  end
end
