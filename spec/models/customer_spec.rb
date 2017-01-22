require 'rails_helper'
describe Customer do
  context "validations" do
    it "factories should be valid" do
      expect(create(:customer)).to be_valid
    end
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe "associations" do
    it { should have_many :funerals }
  end
end
