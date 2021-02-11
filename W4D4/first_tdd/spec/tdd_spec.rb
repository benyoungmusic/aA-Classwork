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