require "spec_helper"
require "enumerable"

describe Enumerable do
  array = [1,2,3]
  it "correctly puts out the my_each loop" do
    expect(array.my_each{|a| a}).to eq(array.each{|a| a})
  end

  it "correctly puts out the my_each_with_index loop" do
    expect(array.my_each_with_index{|a, i| a; i}).to eq(array.each_with_index{|a, i| a; i})
  end

  it "correctly selects elements from array using my_select" do
    expect(array.my_select{|v| v == 1}).to eq([1])
  end

  it "shows correct output on my_all and my none" do
    expect(array.my_all?{|v| v <= 3}).to be true
    expect(array.my_none?{|v| v == 4}).to be true
  end

  it "correctly counts element in an array using my_count" do
    expect(array.count).to eq(array.my_count)
  end

  it 'correctly returns the my_map method' do
    expect(array.my_map{|i| i + 1 }).to eq([2,3,4])
    expect(array.my_map{|i| i + 1 }).to eq(array.collect{|i| i + 1 })
  end

  it "correctly return the my_inject method" do
    expect(array.my_inject{|sum, i| sum + i }).to eq(array.inject{|sum, i| sum + i })
  end

  it "correctly multiplies elements of array" do
    expect(multiply_els(array)).to eq(6)
  end
end



# should return correct map
#
# should return correct inject
