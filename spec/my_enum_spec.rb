require_relative '../my_enum.rb'

describe Enumerable do
  let(:str_arr) { %w[ant bear cat] }
  let(:num_arr) {[1, 2, 4, 2]}
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

  describe '#my_each_with_index' do
      it 'executes the block for each element with index value' do
        str_arr.my_each_with_index { |item, index| result << item + index.to_s }
        expect(result).to eql(%w[ant0 bear1 cat2])
      end

      it 'return enumerator if block is not given' do
        expect(range.my_each_with_index).to be_an Enumerator
      end
  end

  describe '#my_select' do
      it 'selects items with certain criteria in the block' do
        expect(boolean_arr.my_select { |item| item == true }).to eql([true])
      end

      it 'return enumerator if block is not given' do
        expect(boolean_arr.my_select).to be_an Enumerator
      end
  end

  describe '#my_all?' do
      it 'returns true if all elements true' do
          expect(str_arr.my_all?(String)).to eql(true)
      end

      it 'returns false if any element is false' do
          expect(mix_arr.my_all?(Integer)).to eql(false)
      end
  end

  describe "#my_any?" do
    it "returns true if any element is true" do
      expect(boolean_arr.my_any?).to eql(true)
    end

    it "returns false if none of the elements are true" do
      expect(false_arr.my_any?).to eql(false)
    end
  end

  describe "#my_none?" do
    it "returns true if each element returns false" do
      expect(false_arr.my_none?).to eql(true)
    end

    it "returns false if one of the elements returns true" do
      expect(boolean_arr.my_none?).to eql(false)
    end
  end

  describe "#my_count" do
    it "returns the number of items if argument and block are not given" do
      expect(num_arr.my_count).to eql(4)
    end

    it "returns the number of items that meet the criteria if an argument is given" do
      expect(num_arr.my_count(2)).to eql(2)
    end

    it "counts the number of elements yielding a true value if block is given" do
      expect(num_arr.my_count{|x| x%2 == 0}).to eql(3)
    end
  end

  describe "#my_map" do
    it "returns a new array with the results of running block once for every element" do
      expect(str_arr.my_map{|item| item.size > 3 }).to eql([false, true, false])
    end

    it 'return enumerator if block is not given' do
      expect(range.my_map).to be_an Enumerator
    end

  end

   


end
