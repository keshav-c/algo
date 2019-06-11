def transpose(string)
    result = string.split("").join
    while result.match? /gn/
        result.gsub!(/gn/, "ng")
    end
    return result
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg