require 'tdd'

describe Array do

  describe "#my_uniq" do
    subject(:arr) { [1, 2, 1, 3, 3] }

    it "returns an array" do
      expect(arr.my_uniq).to be_a Array
    end

    it "returns an array with no duplicates" do
      expect(arr.my_uniq).to eq(arr.uniq)
    end

    it "returns elements in their original order" do
      expect(arr.my_uniq.index(1)).to be < arr.my_uniq.index(2)
      expect(arr.my_uniq.index(2)).to be < arr.my_uniq.index(3)
    end

    it "returns all original elements" do
      expect(arr.my_uniq).to include 1, 2, 3
    end
  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it "returns an array" do
      expect(arr.two_sum).to be_a Array
    end

    it "returns an array of arrays" do
      two_d_array = arr.two_sum.all?{ |el| el.is_a?(Array) }
      expect(two_d_array).to be true
    end

    it "contains only pairs" do
      pairs = arr.two_sum.all?{ |el| el.length == 2 }
      expect(pairs).to be true
    end

    it "returns the indices instead of element values" do
      expect(arr.two_sum).not_to eq([[-1,1], [2,-2]])
    end

    it "returns only pairs that sum to zero" do
      zero_sums = arr.two_sum.all?{ |el| arr[el[0]] + arr[el[1]] == 0 }
      expect(zero_sums).to be true
    end

    it "returns pairs sorted dictionary-wise" do
      sorted = arr.two_sum.all? { |el| el == el.sort }
      expect(sorted).to be true
    end

    it "returns all the pairs that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject(:arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]]}

    it "returns a two dimensional array of the same size" do
      expect(arr.my_transpose.length).to eq(3)
    end

    it "has elements of the same size as the original's" do
      correct_lengths = arr.my_transpose.all? { |el| el.length == 3 }
      expect(correct_lengths).to be true
    end

    it "contains all the original elements" do
      contains_originals = arr.flatten.all? do |el|
        arr.my_transpose.flatten.include?(el)
      end

      expect(contains_originals).to be true
    end

    it "it converts the array from row oriented to column oriented" do
      expect(arr.my_transpose).to eq(arr.transpose)
    end
  end

  describe "#stock_picker" do
    subject(:arr) { [1, 10, 4, 15, 6] } #==> [0,3]
    let(:picker) { arr.stock_picker }

    it "returns an array of integers" do
      expect(picker).to be_a(Array)
      expect(picker.all? { |el| el.is_a?(Integer)}).to be true
    end

    it "returns a pair of indices from the original array" do
      expect(picker.length).to eq(2)
      #expect(picker[0]).to be_between(0,4)
      picker.each { |el| expect(el).to be_between(0, 4) }
    end

    it "calculates highest return from stock prices" do
      expect(picker).to eq([0, 3])
    end

    it "it calculates the return based on buying before selling" do
      # first el must be less than second el
      expect(picker[0]).to be < picker[1]
    end
  end
end
