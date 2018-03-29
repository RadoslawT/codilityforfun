def max_bin_gap(n)
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

def test_max_bin_gap
	[0, 592, 20, 15].each do |n|
	  puts "n: #{n} bin: #{n.to_s(2)} gap: #{max_bin_gap(n)}"
	end
end
