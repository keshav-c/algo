def all_but_i(array, index)
    res = []
    for i in (0...array.length)
        res << array[i] if i != index
    end
    res
end

def exact_sum?(k, coins)
    result = coins.each_with_index do |coin, i|
        remaining = all_but_i(coins, i)
        if k == coin
            return true
        elsif k > coin and !remaining.empty?
            return true if exact_sum?((k - coin), remaining)
        else
            next
        end
    end
    false
end

puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true
puts "------------------------------------"
puts exact_sum?(11, [1, 5, 9, 13])
# => false
puts "------------------------------------"
puts exact_sum?(15, [1,7,2,6,3,4,8])