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

end

[1, 3, 3].my_each{ |i| puts "hi: #{i}"} 
[1, 3, 3].my_each_with_index{ |i, indx| puts "hi: #{i}, #{indx}"} 