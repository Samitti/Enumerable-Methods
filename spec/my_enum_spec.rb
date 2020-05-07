require './my_enum'

describe Enumerable do
    let(:my_enum) {Enumerable.new}
    let(:str_arr) {%w[ant bear cat]}
    let(:mix_arr) {[nil, true, 99]}
    let(:empty_arr) {[]}
    let(:range) {(1..5)}
    let(:nil_arr) {[nil]}
    let(:false_arr) {[nil,false]}
    let(:boolean_arr) {[nil,false,true]}

    describe '#my_each' do
        #let(:my_each_test) {my_enum.my_each}
        it 'returs each item of the object' do
            expect(str_arr.my_each {|item| item}).to eq(str_arr.each {|item| item})
        end
    end


    
end
