class Sorter
  def Sorter.is_sorted_asc?(array)
    i = 1
    while i < array.length
      if array[i] < array[i - 1]
        return false
      end
      i += 1
    end
    true
  end

  def Sorter.insertion_sort_asc(array)
    index_sorted_upto = 0
    while index_sorted_upto < array.length - 1
      index_to_sort = index_sorted_upto + 1
      element = array.delete_at(index_to_sort)
      i = index_sorted_upto
      while i >= 0
        break if array[i] <= element
        i -= 1
      end
      array.insert(i + 1, element)
      index_sorted_upto += 1
    end
    array
  end

  def Sorter.running_time(array)
    num_shifts = 0
    index_sorted_upto = 0
    while index_sorted_upto < array.length - 1
      index_to_sort = index_sorted_upto + 1
      element = array.delete_at(index_to_sort)
      i = index_sorted_upto
      while i >= 0
        break if array[i] <= element
        i -= 1
      end
      array.insert(i + 1, element)
      index_sorted_upto += 1
      num_shifts += index_to_sort - (i + 1)
    end
    num_shifts
  end

  def Sorter.full_counting_sort(array)
    num = array.map { |el| el[/\d+/].to_i }
    data = array.map { |el| el[/[a-zA-Z]+/] }
    num_frequencies = Array.new(100, 0)
    num.each { |n| num_frequencies[n] += 1 }
    elements_lte = num_frequencies
    i = 1
    while i < elements_lte.size
      elements_lte[i] += elements_lte[i - 1]
      i += 1
    end
    starting_pos = elements_lte
    starting_pos.unshift(0)
    starting_pos.delete_at(-1)
    sorted = Array.new(array.length)
    num.each.with_index do |n, i|
      index = starting_pos[n]
      sorted[index] = data[i]
      starting_pos[n] += 1
    end
    sorted
  end

  def Sorter.simple_quicksort(array)
    return array if array.length <= 1
    pivot = array.first
    left = array[1..-1].select { |el| el <= pivot }
    left = simple_quicksort(left)
    right = array[1..-1].select { |el| el > pivot }
    right = simple_quicksort(right)
    sorted = left + [pivot] + right
  end
end