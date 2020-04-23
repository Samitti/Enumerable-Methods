# frozen_string_literal: true

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
    if !args.nil?
      my_each { |x|  return false unless args === x } # obj.kind_of?(mod)
    elsif !block_given?
      my_each { |x|  return false unless x }
    else
      my_each { |x|  return false unless yield(x) }
    end
    true
  end

  # my_any?
  def my_any?(args = nil)
    result = false
    if !args.nil?
      my_each { |x| result = true if args === x } # obj.kind_of?(mod)
    elsif !block_given?
      my_each { |x| result = true if x }
    else
      my_each { |x| result = true if yield(x) }
    end
    result
  end

  # my_none?
  def my_none?
    result = true
    my_each do |item|
      result = false if yield(item)
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
        result << item if proc.call(item)
      end
    end
    result
  end

  # my_inject
  def my_inject(args = nil)
    i = 0
    result = 0
    couted = 0
    if args.to_i >= 1
      while i < args.to_i
        my_each do |item|
          result = yield(result, item)
        end
        i += 1
      end
    else
      my_each do |item|
        result = yield(result, item)
      end
    end
    result
  end

  
  # p (5..10).my_inject1 { |sum, n| sum + n }

end
