def bubble_sort_vanilla(array)
    i = 1
    unsorted = array.size 
    while unsorted > 1
        while i < unsorted
            if array[i-1] > array[i]
                array[i-1], array[i] = array[i], array[i-1]
            end
            i += 1
        end
        i = 1
        unsorted -= 1
    end
    array
end

# refactor vanilla

def bubble_sort(array)
    (array.size - 1).downto(1).each do |i|
        1.upto(i).each do |j|
            if array[j-1] > array[j]
                array[j-1], array[j] = array[j], array[j-1]
            end
        end
    end
    array
end

def bubble_sort_by(array)
    (array.size - 1).downto(1).each do |i|
        1.upto(i).each do |j|
            if yield(array[j-1], array[j]) > 0
                array[j-1], array[j] = array[j], array[j-1]
            end
        end
    end
    array
end

array = [4,3,78,2,0,2]
puts "sorted array: #{bubble_sort(array).join(", ")}"
puts "unsorted array: #{array}"
puts "----------"
ar = bubble_sort_by(array) {|prev_el, next_el| next_el <=> prev_el}
puts "sorted array: #{ar.join(", ")}"
puts "unsorted array: #{array}"
puts "----------"
ar = bubble_sort_by(["hi","hello","hey"]) {|prev_el, next_el| prev_el.length - next_el.length}
puts "sorted array: #{ar.join(", ")}"