require './lib/prime_checker'

RSpec.describe PrimeChecker do
  
  context "#sieve_of_erastothenes" do
    it "gets all primes below 10" do
      pc = PrimeChecker.new(10)
      expect(pc.primes).to eql Set.new([2,3,5,7])
    end
    it "gets all primes below 50" do
      pc = PrimeChecker.new(50)
      expect(pc.primes).to eql Set.new([2,3,5,7,11,13,17,19,23,29,31,37,41,43,47])
    end
  end

  context "#number_of_primes" do
    before { @pc = PrimeChecker.new }

    it "works for example 1" do
      expect(@pc.number_of_primes([2, 3, 5, 6, 9])).to eql 3
    end
    it "works for example 2" do
      expect(@pc.number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])).to eql 4
    end
    it "works for example 3" do
      expect(@pc.number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])).to eql 3
    end
    it "works for example 4" do
      expect(@pc.number_of_primes([55, 11, 33, 25, 15, 66, 35, 44, 16, 9, 22])).to eql 1
    end
    it "works for example 5" do
      expect(@pc.number_of_primes([8035, 6759, 6113, 8721, 5595, 5985, 4643, 849, 629, 8933, 3659, 6086, 4337, 4589, 9119, 8049, 9337, 3407, 28, 6771, 1069, 3500, 8549, 9251, 2131, 5425, 2471, 11, 8173, 5277])).to eql 10
    end
    it "works for example 6" do
      expect(@pc.number_of_primes([6358, 8623, 2345, 1385, 6037, 9161, 796, 8125, 8829, 9747, 2834, 3579, 1043, 1880, 3508, 9822, 8739, 2372, 7723, 5049, 2661, 5982, 9692, 9427, 562, 6617, 3756, 396, 7009, 3907, 6920, 3766, 6139, 6310, 7011, 650, 4758, 5153, 6200, 3146])).to eql 6
    end
    it "works for example 7" do
      expect(@pc.number_of_primes([1817, 2231, 217, 371, 155, 943, 1219, 553, 679, 1057, 485, 253, 287, 299, 437, 713, 3473])).to eql 0
    end
    it "works for example 8" do
      expect(@pc.number_of_primes([1817, 41, 2231, 217, 3631, 371, 155, 943, 1219, 553, 8803, 679, 1057, 485, 253, 287, 299, 437, 713, 3473])).to eql 3
    end
  end

  context "#prime_prime" do
    before { @pc = PrimeChecker.new }

    it "works for example 1" do
      expect(@pc.prime_prime([2, 3, 5, 6, 9])).to eql 3
    end
    it "works for example 2" do
      expect(@pc.prime_prime([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])).to eql 11
    end
    it "works for example 3" do
      expect(@pc.prime_prime([7, 6, 7, 3, 77, 14, 28, 35, 42])).to eql 7
    end
    it "works for example 4" do
      expect(@pc.prime_prime([55, 11, 33, 25, 15, 66, 35, 44, 16, 9, 22])).to eql 11
    end
    it "works for example 5" do
      expect(@pc.prime_prime([8035, 6759, 6113, 8721, 5595, 5985, 4643, 849, 629, 8933, 3659, 6086, 4337, 4589, 9119, 8049, 9337, 3407, 28, 6771, 1069, 3500, 8549, 9251, 2131, 5425, 2471, 11, 8173, 5277])).to eql 3
    end
    it "works for example 6" do
      expect(@pc.prime_prime([6358, 8623, 2345, 1385, 6037, 9161, 796, 8125, 8829, 9747, 2834, 3579, 1043, 1880, 3508, 9822, 8739, 2372, 7723, 5049, 2661, 5982, 9692, 9427, 562, 6617, 3756, 396, 7009, 3907, 6920, 3766, 6139, 6310, 7011, 650, 4758, 5153, 6200, 3146])).to eql 2
    end
    it "works for example 7" do
      expect(@pc.prime_prime([1817, 2231, 217, 371, 155, 943, 1219, 553, 679, 1057, 485, 253, 287, 299, 437, 713, 3473])).to eql 23
    end
    it "works for example 8" do
      expect(@pc.prime_prime([221, 2787, 121, 169, 6503, 289, 4645])).to eql 929
    end
  end
end