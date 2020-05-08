require_relative '../my_enum.rb'

describe Enumerable do
  let(:my_enum) { Enumerable.new }
  let(:str_arr) { %w[ant bear cat] }
  let(:mix_arr) { [nil, true, 99] }
  let(:empty_arr) { [] }
  let(:range) { (1..5) }
  let(:nil_arr) { [nil] }
  let(:false_arr) { [nil, false] }
  let(:boolean_arr) { [nil, false, true] }

  describe '#my_each' do
    it 'returns the array itself' do
      expect(str_arr.my_each { |item| item }).to eql(str_arr)
    end

    it 'returns a range itself' do
      expect(range.my_each { |item| item }).to eql(range)
    end

    it 'return enumerator if block is not given' do
      expect(range.my_each).to be_an Enumerator
    end
  end
end
