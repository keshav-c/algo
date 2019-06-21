def all_but_i(array, index)
    res = []
    for i in (0...array.length)
        res << array[i] if i != index
    end
    res
end

def exact_sum?(k, coins)
    result = coins.each_with_index.map do |coin, i|
        remaining = all_but_i(coins, i)
        puts "Coin: #{coin}; Remaining: [#{remaining.join(", ")}]"
        if remaining.empty?
            puts "Returning #{k == coin}"
            k == coin
        else
            if k == coin
                puts "returning #{k == coin}"
                true
            elsif k > coin
                puts "returning exact_sum?(#{k-coin},[#{remaining.join(", ")}])"
                exact_sum?((k - coin), remaining)
            else
                puts "returning false"
                false
            end
        end
    end
    puts "result..."
    result.any?
end

# puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

# puts exact_sum?(11, [1, 5, 9, 13])
# => false

puts exact_sum?(35, [1,7,3,4,2,5])