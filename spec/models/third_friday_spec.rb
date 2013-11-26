require 'spec_helper'

describe ThirdFriday do

  let(:finder) { ThirdFriday.new(month) }

  describe '#find_third_friday' do

    subject { finder.find }

    context "October 2013" do
      let(:month) { Date.new(2013, 10, 8) }
      it 'returns the third friday of the given month' do
        subject.should == Date.new(2013, 10, 18)
      end
    end

    context "July 2013" do
      let(:month) { Date.new(2013, 7, 14) }
      it 'returns the third friday of the given month' do
        subject.should == Date.new(2013, 7, 19)
      end
    end

    context "June 2013" do
      let(:month) { Date.new(2013, 6, 1) }
      it 'returns the third friday of the given month' do
        subject.should == Date.new(2013, 6, 21)
      end
    end

  end
end
