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

  def Sorter.insertion_sort_running_time(array)
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

  def Sorter.advanced_quicksort(array, s=0, e = array.length - 1)
    if s < e
      pivot_index = partition(array, s, e)
      advanced_quicksort(array, s, pivot_index - 1)
      advanced_quicksort(array, pivot_index + 1, e)
    end
    array
  end

  def Sorter.quicksort_running_time(array)
    quicksort(array)
    num_swaps = swap_count
    # self.swap_count = 0 # make swap count instance variable
    {sorted: array, swaps: num_swaps}
  end

  def merge_sort(array)
    len = array.length
    if len == 1
      array
    else
      left, right = [array[0...(len/2).ceil], array[(len/2).ceil..-1]]
      left = merge_sort(left)
      right = merge_sort(right)
      merge(left, right)
    end
  end

  def merge(array1, array2)
    combined = []
    until array1.empty? || array2.empty?
      index1 = get_index array1.first
      index2 = get_index array2.first
      item_to_insert = index1 <= index2 ? array1.shift : array2.shift
      combined << item_to_insert
    end
    combined.concat(array1, array2)
  end

  def get_index(obj)
    obj[/\d+/].to_i
  end
  
  def extract_data(array)
    array.map { |element| element[/[a-zA-Z]+/] }
  end
  
  def full_merge_sort(array)
    array = merge_sort(array)
    extract_data(array)
  end

  private
    def Sorter.partition(array, s, e)
      swap_index = s
      i = s
      while i < e
        if array[i] <= array[e]
          array[i], array[swap_index] = array[swap_index], array[i]
          # self.swap_count += 1 # use swap_count instance variable to keep track of running time
          swap_index += 1
        end
          i += 1
      end
      array[swap_index], array[e] = array[e], array[swap_index]
      # self.swap_count += 1 # for running time
      swap_index
    end
end