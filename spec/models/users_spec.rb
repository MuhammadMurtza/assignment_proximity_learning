require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }

    it { is_expected.to validate_length_of(:first_name).is_at_most(25) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(50) }

    it { is_expected.to allow_value("example@example.com").for(:email) }
    it { is_expected.not_to allow_value("invalid_email").for(:email) }

    it { is_expected.to allow_value("123-456-7890").for(:phone_number) }
    it { is_expected.not_to allow_value("1234567890").for(:phone_number) }
  end

  describe "columns" do
    it "should have store accessor for address with accessors street, city, state, and zip" do
      user = described_class.new
      expect(user).to respond_to(:street)
      expect(user).to respond_to(:city)
      expect(user).to respond_to(:state)
      expect(user).to respond_to(:zip)
    end
    it "should have store accessor for personal_info with accessors first_name, last_name, nick_name, and phone" do
      user = described_class.new
      expect(user).to respond_to(:first_name)
      expect(user).to respond_to(:last_name)
      expect(user).to respond_to(:nick_name)
      expect(user).to respond_to(:phone_number)
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:employments).dependent(:destroy) }
  end
end
