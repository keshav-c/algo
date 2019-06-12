def transpose(string)
    array = string.split("")
    deque = []
    result = []
    array.each_with_index do |c, i|
      if c == "n"
        deque.unshift(c)
      elsif c == "g"
        deque.push(c)
      else
        result += deque + [c]
        deque = []
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
