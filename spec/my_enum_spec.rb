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
  let(:result) {[]}

  describe '#my_each' do    
    it 'executes the block for each of the array’s elements if block given' do      
      str_arr.my_each { |item| result << item + 'xx' }
      expect(result).to eql(%w[antxx bearxx catxx])
    end

    it 'return enumerator if block is not given' do
      expect(range.my_each).to be_an Enumerator
    end
  end
end
