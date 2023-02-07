require "rails_helper"

RSpec.describe Employment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:employer) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
