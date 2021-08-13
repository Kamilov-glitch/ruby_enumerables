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

  def my_select(val)
    arr = []
    self.my_each { |i| arr.push(i) if i == val }
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

end

# [1, 3, 3].my_each{ |i| puts "hi: #{i}"} 
# [1, 3, 3].my_each_with_index{ |i, indx| puts "hi: #{i}, #{indx}"} 
# p [1, 2, 2, 21, 3, 3 ,4 ,7, 3].my_select(3)
# p [7,4,5].my_all?{ |i| i > 2 }
# p [3, 3, 2].my_all?{ |i| i == 3}
# p [1,1,1].my_any?{ |i| i > 2 }
# p [4, 1, 2].my_any?{ |i| i == 3}
p [3, 3, 3, 3].my_none?{ |i| i > 4}
p [3, 3, 3, 3].my_none?{ |i| i == 3}