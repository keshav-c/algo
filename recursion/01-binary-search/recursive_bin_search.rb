def sqrt(number)
    sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval, delta = 10 ** -10)
    mid = (min_interval + max_interval) / 2.0
    puts "Min: #{min_interval}; Mid: #{mid}; Max: #{max_interval}"
    if (number >= (mid ** 2) - delta) && (number <= (mid ** 2) + delta)
        puts "Square Root of #{number} = #{mid}; And mid^2 = #{mid ** 2}"
        return mid
    elsif number > ((mid ** 2) + delta)
        return sqrt_recursive(number, mid, max_interval)
    else
        return sqrt_recursive(number, min_interval, mid)
    end
end

puts sqrt(3.33)
# puts sqrt(7056)