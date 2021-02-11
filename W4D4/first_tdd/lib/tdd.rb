def my_uniq(arr)
  raise "Arg is not an array" if !arr.is_a?(Array) 
  new_arr = []
  arr.each {|el| new_arr << el unless new_arr.include?(el)}
  new_arr
end

class Array
  def two_sum
    result = []
    self.each_with_index do |el_1, i_1|
      self.each_with_index do |el_2, i_2|
        if i_1 < i_2 
          result << [i_1, i_2] if el_1 + el_2 == 0
        end
      end
    end
    return result
  end
end

def my_transpose(matrix)
  return matrix if matrix.length == 1
  new_arr = Array.new(matrix.length) { Array.new (matrix.length) }
  matrix.each_with_index do |el_1, i_1|
    el_1.each_with_index do |el_2, i_2|
      new_arr[i_2][i_1] = el_2
    end
  end
  new_arr
end

def stock_picker(arr)
  (0...arr.length).each do |i|
    raise "array must contain stonk prices" unless arr[i].is_a?(Integer)
  end
end