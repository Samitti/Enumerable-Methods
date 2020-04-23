module Enumerable
  # my_each
  def my_each
    each do |item|
      yield(item)
    end
  end

  # my_each_with_index
  def my_each_with_index
    i = 0
    each do |item|
      yield(item, i)
      i += 1
    end
  end

  # my_select
  def my_select
    result = []
    my_each do |item|
      result << item if yield(item)
    end
    result
  end

  # my_all
  def my_all?(args = nil)
    if !args.nil? # obj.kind_of?(mod)
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
    result = []
    my_each do |item|
      if block_given?
        result << item if yield(item)
      else
        result << item if proc.call(item) # rubocop:disable Style/IfInsideElse
      end
    end
    result
  end

  # my_inject
  def my_inject(initial_value = nil, &block)
    if initial_value.nil?
      final_result = to_a[1..-1].my_inject(first, &block)
    else
      final_result = initial_value
      my_each do |x|
        final_result = yield(final_result, x) if block_given?
      end
    end
    final_result
  end
end

# multiply_els
def multiply_els(arr)
  arr.my_inject { |total, z| total * z }
end
