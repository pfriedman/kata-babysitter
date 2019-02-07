require "spec_helper"
require "time"

describe Calculator do

  let(:start_time) { Time.parse("2019-01-01 5:00PM") }
  let(:end_time) { Time.parse("2019-01-02 4:00AM") }
  let(:family) { Family.new }

  subject { described_class.new(start_time: start_time, end_time: end_time, family: family) }

  describe "#new" do

    it { expect(subject).not_to be_nil }

    it "sets the attributes on the class" do
      expect(subject.start_time).to eq start_time
      expect(subject.end_time).to eq end_time
      expect(subject.family).to eq family
    end

  end

  describe "#total_pay" do

    it "returns an integer" do
      expect(subject.total_pay).to be_an_instance_of(Integer)
    end

    context "for one hours work" do
      let(:start_time) { Time.parse("2019-01-01 5:00PM") }
      let(:end_time) { Time.parse("2019-01-01 6:00PM") }

      it "returns 15" do
        expect(subject.total_pay).to eq 15
      end
    end

    context "for two hours work" do
      let(:start_time) { Time.parse("2019-01-01 5:00PM") }
      let(:end_time) { Time.parse("2019-01-01 7:00PM") }

      it "returns 30" do
        expect(subject.total_pay).to eq 30
      end
    end

  end

end