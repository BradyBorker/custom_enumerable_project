module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    counter = 0
    self.my_each do |num|
      block.call(num, counter)
      counter += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for num in self
      block.call(num)
    end
  end
end

