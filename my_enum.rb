module Enumerable

  # my_each
  def my_each
    return my_each.dup unless block_given?

    for item in self
    yield(item)
    end
  end

  # my_each_with_index
  def my_each_with_index
    return my_each_with_index.dup unless block_given?

    i = 0
    for item in self
      yield(item[i], i)
      i += 1
    end
  end

# my_select
def my_select
  return my_select.dup unless block_given?

  result = []
  my_each do |item|
    if yield(item)
      result << item
    end
  end
  result
end

# my_all
def my_all?
  return self.dup unless block_given?

  result = true
  my_each do |item|
    unless yield(item)
      result = false
    end
  end
  result
end

# my_any?
def my_any?
  return self.dup unless block_given?

  result = false
  my_each do |item|
    if yield(item)
      result = true
    end
  end
  result
end

# my_none?
def my_none?
  return self.dup unless block_given?

  result = true
  my_each do |item|
    if yield(item)
      result = false
    end
  end
  result
end

# my_count
def my_count
  return self.length unless block_given?

  result = 0
  my_each do |item|
    if yield(item)
      result += 1
    end
  end
  result
end

# my_map
def my_map

  result = []
  my_each do |item|
    if yield(item)
      result << item
    end
  end
  result
end

end

