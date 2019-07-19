class HashTable
  attr_reader :hash_function, :table

  def initialize(table_size, proc)
    @table = Array.new(table_size, [])
    @hash_function = proc
  end

  def populate(array)
    array.each { |el| table[hash_function.call(el)] += [el] }
    true
  end

  def flatten(no_nil = true)
    flat_arr = []
    table.each do |bucket|
      bucket.each do |data|
        if no_nil
          flat_arr << data unless data.nil?
        else
          flat_arr << data
        end
      end
    end
    flat_arr
  end
end