    # [1, 3, 7, 6]
    # [0,1,2,3,4,5,6]
    # [false, true, false, true, false]

class MaxIntSet
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  
  attr_accessor :store

  private
  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    mod = num % num_buckets

    @store[mod] << num 
  end

  def remove(num)
    mod = num % num_buckets

    if self.include?(num)
      @store[mod].delete(num)
    end
  end

  def include?(num)
    mod = num % num_buckets

    @store[mod].include?(num)
  end



  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    # if @count > @store.length

    mod = num % num_buckets
    if self.include?(num) == false
      @store[mod] << num
      @count += 1
    end

    if @count == @store.length
      p @store.length
      p @count
       resize! 
    end
  end

  def remove(num)
    if self.include?(num)
      @store -= [[num]]
      @count -= 1
    end
  end

  def include?(num)
    mod = num % num_buckets
    @store[mod].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = []

    @store.each() do |bucket|
      if bucket != []
        bucket.each() {|ele| arr << ele}
      end
    end

    @num_buckets = @num_buckets * 2
    @store = Array.new(@num_buckets) { Array.new }
    
    arr.each() do |el|
      self.insert(el)
    end


  end
end
