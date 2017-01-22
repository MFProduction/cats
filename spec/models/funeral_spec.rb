require 'rails_helper'
describe Funeral do
  context "validations" do
    it "factories should be valid" do
      expect(create(:funeral)).to be_valid
    end

    let(:funeral) {create(:funeral)}

    it { should validate_presence_of :cat_name }
    it { should allow_value(Time.now+1.hour).for(:start_time) }
    it { should_not allow_value(Time.now-1.hour).for(:start_time) }

    it "should take 2 hours" do
      expect(funeral.end_time).to be_present
      expect(funeral.end_time).to eq(funeral.start_time+2.hour)
    end
  end

  describe "associations" do
    it { should belong_to :customer }
  end
end
