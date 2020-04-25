module Enumerable
  # my_each
  def my_each
    return enum_for(:my_each) unless block_given?

    index = 0
    while index < size
      if is_a? Array
        yield self[index]
      elsif is_a? Hash
        yield keys[index], self[keys[index]]
      elsif is_a? Range
        yield to_a[index]
      end
      index += 1
    end
  end

  # my_each_with_index
  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    i = 0
    my_each do |item|
      yield(item, i)
      i += 1
    end
  end

  # my_select
  def my_select
    return enum_for(:my_select) unless block_given?

    result = []
    my_each do |item|
      result << item if yield(item)
    end
    result
  end

  # my_all
  def my_all?(args = nil)
    if !args.nil?
      my_each { |x| return false unless args === x } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |x| return false unless x }
    else
      my_each { |x| return false unless yield(x) }
    end
    true
  end

  # my_any?
  def my_any?(args = nil)
    result = false
    if !args.nil?
      my_each { |x| result = true if args === x } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |x| result = true if x }
    else
      my_each { |x| result = true if yield(x) }
    end
    result
  end

  # my_none?
  def my_none?(args = nil)
    result = true
    if !args.nil?
      my_each { |x| result = false if args === x } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |x| result = false if x }
    else
      my_each { |x| result = false if yield(x) }
    end
    result
  end

  # my_count
  def my_count(args = nil)
    result = 0
    if !args.nil?
      my_each { |x| result += 1 if x == args }
    elsif !block_given?
      return length
    else
      my_each { |x| result += 1 if yield(x) }
    end
    result
  end

  # my_map
  def my_map(&proc)
    return enum_for(:my_select) unless block_given?

    result = []
    my_each do |item|
      if block_given?
        result << yield(item) ? true : false
      else
        result << proc.call(item) ? true : false
      end
    end
    result
  end

  # my_inject
  def my_inject(initial = nil, second = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    sym = initial if initial.is_a?(Symbol) || initial.is_a?(String)
    result = initial if initial.is_a? Integer

    if initial.is_a?(Integer)
      sym = second if second.is_a?(Symbol) || second.is_a?(String)
    end

    if sym
      my_each { |item| result = result ? result.send(sym, item) : item }
    elsif block_given?
      my_each { |item| result = result ? yield(result, item) : item }
    end
    result
  end
end

# multiply_els
def multiply_els(arr)
  arr.my_inject { |result, num| result * num }
end
