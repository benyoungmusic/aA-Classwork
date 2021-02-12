require 'rspec'
require 'tdd'

describe "my_uniq" do 
  
  it "raises a type error if arg is not an array" do 
    expect {my_uniq(5)}.to raise_error("Arg is not an array")
  end
  it "removes duplicates from array" do
    expect(my_uniq(["a", "b", "c", "c"])).to eq(["a", "b", "c"])
  end
  it "returns unique elements in their original order" do
    expect(my_uniq(["a", "c", "b", "c", "c"])).to eq(["a", "c", "b"])
  end
end

describe Array do
  describe "#two_sum" do
    it "raises a NoMethod error if arg is not an array" do
      expect {"hello".two_sum}.to raise_error(NoMethodError)
    end
    it "does not raise an error if arg is an array" do 
      expect{[1,2].two_sum}.to_not raise_error
    end
    it "returns an empty array when no pairs add to 0" do
      expect([1,2,3,4].two_sum).to eq([])
    end
    it "returns pairs that sum to zero" do 
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    it "sorts pairs smallest to largest" do 
      expect([1, -2, 2, 0, -1].two_sum).to eq([[0, 4], [1, 2]])
    end
  end
end

describe "my_transpose" do 
  it "returns an array of the same length" do 
    expect(my_transpose([1]).length).to eq(1)
  end
  it "rotates the matrix 270 degrees" do 
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "stock_picker" do
  it "should accept an array of stock prices" do
    expect{stock_picker([1,2,3])}.to_not raise_error
    expect{stock_picker([1,2,"g"])}.to raise_error("array must contain stonk prices")
  end
  it "should return a pair of days in chronological order" do
    expect(stock_picker([100, 1])).to eq([0, 1])
  end
  it "should contain at least two days" do 
    expect{stock_picker([1])}.to raise_error("Please input at least two days")
  end
  it "should not be fooled by a relative maximum" do 
    expect(stock_picker([15, 20, 45, 100, 5, 95])).to eq([4, 5])
  end

  it "should return the most profitable pair of days as an array" do
    expect(stock_picker([20, 15, 45, 100, 5, 95])).to eq([4, 5])
  end

end

describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new(5)}
  describe "#initialize" do
    it "should set up 3 piles" do
      expect(game.piles.length).to eq(3)
    end
    it "all discs should be stacked in first pile" do
      expect(game.piles[0].length).to eq(5)
    end
    it "should accept the number discs as an argument" do
      expect(game.num_discs).to eq(5)
    end
  end

  describe "#move" do 
    
    before(:each)  { game.move([0, 1]) }
    it "should raise an error if invalid response" do 
      expect{move([0, 4])}.to raise_error("Invalid Response")
    end
    
    it "should move a piece to the front of a pile" do 
      expect(game.piles[1].length).to eq(1) 
    end

    context "when moving pieces" do
      before(:each) {game.piles = [[5], [4, 3], [2, 1]]}
      it "should raise error if end_pos.last is smaller than start_pos.last" do 
        expect{game.move([0, 1])}.to raise_error("End disk is smaller than start disk")  
      end
    end

  end
end

# it "all discs should be stacked in order" do
# end