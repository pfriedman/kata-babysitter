require "spec_helper"

describe Family do

  subject { described_class.new }

  describe "#new" do

    it { expect(subject).not_to be_nil }

  end

  describe "#rate" do

    it "returns an integer" do
      expect(subject.rate).to be_an_instance_of(Integer)
    end

  end

end