def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  mid = (min_interval + max_interval) / 2
  # puts "Min: #{min_interval}; Mid: #{mid}; Max: #{max_interval}"
  if number == mid ** 2
    return mid
  elsif number > (mid ** 2)
    return sqrt_recursive(number, mid, max_interval)
  else
    return sqrt_recursive(number, min_interval, mid)
  end
end

puts sqrt(25)
puts sqrt(7056)