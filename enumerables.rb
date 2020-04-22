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




end

