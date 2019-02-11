require "spec_helper"

describe Calculator do

  let(:start_time) { Time.parse("2019-01-01 5:00PM") }
  let(:end_time) { Time.parse("2019-01-02 4:00AM") }
  let(:rate_type) { "A" }
  let(:rate) { Rate.new(rate_type) }

  subject { described_class.new(start_time: start_time, end_time: end_time, rate: rate) }

  describe "#new" do

    it { expect(subject).not_to be_nil }

    it "sets the attributes on the class" do
      expect(subject.start_time).to eq start_time
      expect(subject.end_time).to eq end_time
      expect(subject.rate).to eq rate
    end

  end

  describe "#total_pay" do

    it "returns an integer" do
      expect(subject.total_pay).to be_an_instance_of(Integer)
    end

    context "for one hours work" do
      let(:start_time) { Time.parse("2019-01-01 5:00PM") }
      let(:end_time)   { Time.parse("2019-01-01 6:00PM") }

      it "returns 15" do
        expect(subject.total_pay).to eq 15
      end
    end

    context "for two hours work" do
      let(:start_time) { Time.parse("2019-01-01 5:00PM") }
      let(:end_time)   { Time.parse("2019-01-01 7:00PM") }

      it "returns 30" do
        expect(subject.total_pay).to eq 30
      end
    end

    context "fractional hours" do
      let(:start_time) { Time.parse("2019-01-01 5:00PM") }
      let(:end_time)   { Time.parse("2019-01-01 6:30PM") }

      it "returns pay for the full hour" do
        expect(subject.total_pay).to eq 30
      end
    end

    context "over switch-over hours" do

      let(:start_time) { Time.parse("2019-01-01 10:00PM") }
      let(:end_time)   { Time.parse("2019-01-02 12:30AM") }

      it "handles changes in rates depending on hours worked" do
        expect(subject.total_pay).to eq 55
      end

    end

  end

end