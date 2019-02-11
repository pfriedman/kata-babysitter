require "spec_helper"

describe Rate do

  subject { described_class.new }

  describe "#new" do

    it { expect(subject).not_to be_nil }

  end

  describe "#for_hour" do
    context "Family A pays $15 per hour before 11pm, and $20 per hour the rest of the night" do
      it do
        [
          ["5:00PM", 15],
          ["6:00PM", 15],
          ["7:00PM", 15],
          ["8:00PM", 15],
          ["9:00PM", 15],
          ["10:00PM", 15],
          ["11:00PM", 20],
          ["12:00AM", 20],
          ["1:00AM", 20],
          ["2:00AM", 20],
          ["3:00AM", 20],
          ["4:00AM", 20],
        ].each do |hour, rate|
          expect(subject.for_hour(Time.parse("2019-01-01 #{hour}"))).to eq rate
        end
      end
    end

    context "Family B pays $12 per hour before 10pm, $8 between 10 and 12, and $16 the rest of the night" do

    end

    context "Family C pays $21 per hour before 9pm, then $15 the rest of the night" do

    end
  end

end
