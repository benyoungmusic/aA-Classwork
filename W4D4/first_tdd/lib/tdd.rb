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
  raise "Please input at least two days" if arr.length < 2
  
  cur_max_prof = arr[1] - arr[0]
  cur_max_days = [0, 1]

  arr.each_with_index do |el_1, i_1|
    arr.each_with_index do |el_2, i_2|
      if i_2 > i_1 && (el_2 - el_1) > cur_max_prof
        cur_max_prof = (el_2 - el_1) 
        cur_max_days = [i_1, i_2]
      end
    end
  end
  cur_max_days

end

class TowersOfHanoi
  attr_reader :piles, :num_discs
  def initialize(num_discs)
    @num_discs = num_discs
    @piles = Array.new(3) {Array.new}
    (1..@num_discs).each do |num|
      @piles.unshift(num)
    end
  end

end