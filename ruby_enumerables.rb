module Enumerable

  def my_each
    if block_given?
      for i in 0..self.length - 1
        yield(self[i])
      end
    end
  end

  def my_each_with_index
    if block_given?
      for i in 0..self.length - 1
        yield(self[i], i)
      end
    end
  end

  def my_select
    arr = []
    self.my_each { |i| arr.push(i) if yield(i) == true }
    arr
  end

  def my_all?
    self.my_each{ |i| return false if yield(i) == false } 
    true
  end

  def my_any?
    self.my_each{ |i| return true if yield(i) == true } 
    false
  end
  
  def my_none?
    return true if self.my_all?{|i| yield(i)} == false
    false
  end

  def my_count(val)
    self.my_select{ |i| i == val}.length
  end
  
  def my_map
    new_arr = []
    self.each{|i| new_arr.push(yield(i)) }
    new_arr 
  end

  def my_inject(sum = 0)
    total = sum
    self.each{ |i| total = yield(total, i)}
    total
  end

  def my_map_proc(arg)
    new_arr = []
    self.each{ |i| new_arr.push(arg.(i)) }
    new_arr
  end

end

# [1, 3, 3].my_each{ |i| puts "hi: #{i}"} 
# [1, 3, 3].my_each_with_index{ |i, indx| puts "hi: #{i}, #{indx}"} 
# p [1, 2, 2, 21, 3, 3 ,4 ,7, 3].my_select{|i| i == 3}
# p [7,4,5].my_all?{ |i| i > 2 }
# p [3, 3, 2].my_all?{ |i| i == 3}
# p [1,1,1].my_any?{ |i| i > 2 }
# p [4, 1, 2].my_any?{ |i| i == 3}
# p [3, 3, 3, 3].my_none?{ |i| i > 4}
# p [3, 3, 3, 3].my_none?{ |i| i == 3}
# p [3, 2, 2, 2, 3, 1, 1, 1, 1, 1, 4].count(2)
# p [3, 2, 2].my_map{|i| i + 2}
# p [2, 4, 5].my_inject(1){ |sum, i| sum*i}
# my_proc = Proc.new { |i| i * 2}
# my_lambda = ->(i) { i * 2}
# p [2, 4, 7].my_map_proc(my_lambda)