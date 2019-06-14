def sqrt(number)
    sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval, delta = 10 ** -10)
    mid = (min_interval + max_interval) / 2.0
    if (number >= (mid ** 2) - delta) && (number <= (mid ** 2) + delta)
        return mid
    elsif number > ((mid ** 2) + delta)
        return sqrt_recursive(number, mid, max_interval)
    else
        return sqrt_recursive(number, min_interval, mid)
    end
end

puts sqrt(3.33)
puts sqrt(7056)
puts sqrt(25)