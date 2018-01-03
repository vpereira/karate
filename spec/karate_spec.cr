require "./spec_helper"

describe Karate do
  it "sorted_array" do
    Karate.new([0,2,1]).sorted_array.should eq([0,1,2])
  end

  describe :chop do

    it "should return the index if it is the middle" do
     k = Karate.new([1,2,3,4,5])
     k.chop(3).should eq(2)
   end
   it "should return -1" do
     k = Karate.new([1,2])
     k.chop(666).should eq(-1)
   end

   it "should return 0" do
     k = Karate.new((1..6).to_a)
     k.chop(1).should eq(0)
   end
  end

  describe :middle_of_range do
    it "should return midde of sorted_array" do
      k = Karate.new([1,2,3,4,5])
      k.middle_of_range(k.sorted_array).should eq(3)
    end
    it "should return midde of default_range" do
      k = Karate.new([1,2,3,4,5])
      k.middle_of_range.should eq(2)
    end
  end
end
