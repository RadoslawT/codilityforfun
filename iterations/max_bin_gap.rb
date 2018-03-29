def max_bin_gap(n)
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
