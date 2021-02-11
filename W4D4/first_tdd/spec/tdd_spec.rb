require 'rspec'
require 'tdd'

describe "my_uniq" do 
  
  it "raises a type error if arg is not an array" do 
    expect {my_uniq(5)}.to raise_error("Arg is not an array")
  end
  
end