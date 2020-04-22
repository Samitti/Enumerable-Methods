module Enumerable
  # my_each
  def my_each
    return my_each.dup unless block_given?

    each do |item|
      yield(item)
    end
  end

  # my_each_with_index
  def my_each_with_index
    return my_each_with_index.dup unless block_given?

    i = 0
    each do |item|
      yield(item[i], i)
      i += 1
    end
  end

  # my_select
  def my_select
    return my_select.dup unless block_given?

    result = []
    my_each do |item|
      result << item if yield(item)
    end
    result
  end

  # my_all
  def my_all1?(*_args)
    my_each do |x|
      return true unless block_given?
      return false unless yield(x)
    end
    true
  end

  # my_any?
  def my_any?
    return dup unless block_given?

    result = false
    my_each do |item|
      result = true if yield(item)
    end
    result
  end

  # my_none?
  def my_none?
    return dup unless block_given?

    result = true
    my_each do |item|
      result = false if yield(item)
    end
    result
  end

  # my_count
  def my_count
    return length unless block_given?

    result = 0
    my_each do |item|
      result += 1 if yield(item)
    end
    result
  end

  # my_map
  def my_map(&proc)
    return self unless block_given?

    result = []
    my_each do |item|
      if block_given?
        result << item if yield(item)
      else
        result << item if proc.call(item)
      end
    end
    result
  end

  # my_inject
  def my_inject
    result = 0
    my_each do |item|
      result = yield(result, item)
    end
    result
  end
end
