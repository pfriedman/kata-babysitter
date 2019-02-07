require "spec_helper"

describe Family do

  subject { described_class.new }

  describe "#new" do

    it { expect(subject).not_to be_nil }

  end

  describe "#rate" do

    context "before 11:00PM" do
      let(:hour_worked) { Time.parse("2019-01-01 5:00PM") }

      it "returns an integer" do
        expect(subject.rate(hour_worked)).to be_an_instance_of(Integer)
        expect(subject.rate(hour_worked)).to eq 15
      end
    end

    context "after 11:00PM" do
      let(:hour_worked) { Time.parse("2019-01-01 11:01PM") }

      it "returns an integer" do
        expect(subject.rate(hour_worked)).to eq 20
      end
    end

    context "after midnight" do
      let(:hour_worked) { Time.parse("2019-01-01 4:00AM") }

      it "returns an integer" do
        expect(subject.rate(hour_worked)).to eq 20
      end
    end
  end

end