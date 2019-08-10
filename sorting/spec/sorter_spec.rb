require './lib/sorter'

RSpec.describe Sorter do
  context ".is_sorted_asc" do
    before {@array = (1..100).to_a}
    
    it "confirms array of numbers from 1 to 100 to be sorted" do
      expect(Sorter.is_sorted_asc? @array).to eql true
    end
    it "confirms shuffled array of numbers to be unsorted" do
      expect(Sorter.is_sorted_asc? @array.shuffle).not_to eql true
    end
  end

  context ".insertion_sort_asc" do
    it "sorts shuffled array of numbers 1 to 30" do
      array = (1..30).to_a.shuffle
      expect(Sorter.is_sorted_asc? Sorter.insertion_sort_asc(array)).to eql true
    end
    it "sorts shuffled array of numbers 1 to 3000" do
      array = (1..3000).to_a.shuffle
      expect(Sorter.is_sorted_asc? Sorter.insertion_sort_asc(array)).to eql true
    end
  end

  context ".running_time" do
    it "correctly counts the number of shifts needed to sort [2,1,3,1,2]" do
      array = [2, 1, 3, 1, 2]
=begin
        1 2 3 1 2 : 1
        1 2 3 1 2 : 1
        1 1 2 3 2 : 1+2=3
        1 1 2 2 3 : 3+1=4
=end
      expect(Sorter.running_time(array)).to eql 4
    end
    it "correctly counts the number of shifts needed to sort [4,3,2,1]" do
      array = [4,3,2,1]
=begin
        3 4 2 1 : 1
        2 3 4 1 : 1+2=3
        1 2 3 4 : 3+3=6
=end
      expect(Sorter.running_time(array)).to eql 6
    end
    it "correctly counts the number of shifts needed to sort a sorted array" do
      array = [1, 1, 2, 2, 3, 3, 5, 5, 7]
      expect(Sorter.running_time(array)).to eql 0
    end
    it "correctly counts the number of shifts needed to sort a reversed array" do
      array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
      expect(Sorter.running_time(array)).to eql 45
    end
    it "correctly counts the number of shifts needed to sort array of length 100" do
      array = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]
      expect(Sorter.running_time(array)).to eql 2856
    end
  end

  context ".simple_quicksort" do
    it "sorts array of 7 elements" do
      array = [5, 8, 1, 3, 7, 10, 2]
      expect(Sorter.simple_quicksort(array)).to eql [1, 2, 3, 5, 7, 8, 10]
    end
    it "sorts array of 9 elements" do
      array = [9, 8, 6, 7, 3, 5, 4, 1, 2]
      expect(Sorter.simple_quicksort(array)).to eql [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    it "sorts array of 100 elements" do
      array = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]
      expect(Sorter.is_sorted_asc? Sorter.simple_quicksort(array)).to eql true
    end
  end

  context ".advanced_quicksort" do
    it "sorts array of 7 elements" do
      array = [1, 3, 9, 8, 2, 7, 5]
      expect(Sorter.advanced_quicksort array).to eql [1,2,3,5,7,8,9]
    end
    it "sorts array of 9 elements" do
      array = [9, 8, 6, 7, 3, 5, 4, 1, 2]
      expect(Sorter.advanced_quicksort array).to eql [1,2,3,4,5,6,7,8,9]
    end
    it "sorts array of 100 elements" do
      array = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]
      expect(Sorter.is_sorted_asc? Sorter.advanced_quicksort(array)).to eql true
    end
  end
end