def transpose(string)
    array = string.split("")
    deque = []
    result = []
    array.each_with_index do |c, i|
      if c == "n"
        deque.unshift(c)
        # puts "Position #{i}, Char #{c}: D: #{deque}" 
      elsif c == "g"
        deque.push(c)
        # puts "Position #{i}, Char #{c}: D: #{deque}" 
      else
        result += deque + [c]
        deque = []
        # puts "Position #{i}, Char #{c}: D: #{deque}"
        # puts "Result: #{result}"
      end
    end
    result += deque unless deque.empty?
    result.join
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg
