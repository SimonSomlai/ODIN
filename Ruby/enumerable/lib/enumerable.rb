module Enumerable
  def my_each(arr=self.to_a)
    arr.length.times {|i| yield(arr[i])}
    arr
  end

  def my_each_with_index(arr=self.to_a)
    arr.length.times {|i| yield(i, arr[i])}
    arr
  end

  def my_select(arr=[])
    self.my_each {|i| (yield i) == true ? arr << i : arr }
    arr
  end

  def my_all?
    (self.my_select {|i| yield(i)}).length == self.length
  end

  def my_none?
    (self.my_select {|i| yield(i) }).length == 0
  end

  def my_count
    self.size
  end

  def my_map(arr=[])
    self.my_each {|i| arr << yield(i)}
    arr
  end

  def my_inject(arg=0, acc=arg)
    self.my_each {|i| acc = yield(acc, i) }
    acc
  end

  def multiply_els(arg)
    # 1 is starting position of accumulator
    arg.my_inject(1){|acc, elem| acc * elem }
  end
end

include Enumerable
