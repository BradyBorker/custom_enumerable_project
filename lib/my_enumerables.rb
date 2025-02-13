module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    counter = 0
    self.my_each do |num|
      block.call(num, counter)
      counter += 1
    end
  end

  def my_select(&block)
    selected = []
    self.my_each do |num|
      if block.call(num)
        selected.push(num)
      end
    end
    return selected
  end

  def my_all?(&block)
    self.my_each do |num|
      if !block.call(num)
        return false
      end
    end
    return true
  end

  def my_any?(&block)
    self.my_each do |num|
      if block.call(num)
        return true 
      end
    end
    return false
  end

  def my_none?(&block)
    self.my_each do |num|
      if block.call(num)
        return false 
      end
    end
    return true
  end

  def my_count(&block)
    count = 0
    if block_given?
      self.my_each do |num|
        if block.call(num)
          count += 1
        end
      end
      return count
    end
    return self.length
  end

  def my_map(&block)
    new_list = []
    self.my_each do |num|
      new_list.append(block.call(num))
    end
    return new_list
  end

  def my_inject(initial_value, &block)
    total = initial_value
    self.my_each do |num|
      total = block.call(total, num)
    end
    return total
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

