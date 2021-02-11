def my_uniq(arr)
  raise "Arg is not an array" if !arr.is_a?(Array) 
  new_arr = []
  arr.each {|el| new_arr << el unless new_arr.include?(el)}
  new_arr
end

class Array
  def two_sum
    result = []
    return result
  end
end