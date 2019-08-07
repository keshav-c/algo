class Array
  def sort_element(index)
    element = self.delete_at(index)
    i = index - 1
    while i >= 0
      break if self[i] < element
      i -= 1
    end
    self.insert(i + 1, element)
    return
  end
end

def sort_itself(array)
  index_sorted_upto = 0
  while index_sorted_upto < array.length - 1
    element_to_sort = index_sorted_upto + 1
    array.sort_element(element_to_sort)
    index_sorted_upto += 1
    puts array.join(' ')
  end
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9

sort_itself([5,4,3,2,1])