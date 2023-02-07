require "rails_helper"

RSpec.describe "Employments", type: :request do
  let(:employment_attributes) { FactoryBot.attributes_for(:employment) }
  let(:valid_session) { {} }
  let(:user) { FactoryBot.create(:user) }

  describe "GET #index" do
    it "returns a success response" do
      get user_employments_path(user), params: {user_id: user.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Employment with valid attribues" do
      expect {
        post user_employments_path(user), params: {employment: employment_attributes}
      }.to change(Employment, :count).by(1)
    end
  end

  describe "PUT/PATCH #update" do
    it "updates the employment successfully" do
      employment = user.employments.create(employment_attributes)
      employment_attributes[:employer] = "Changed"
      put employment_path(employment), params: {employment: employment_attributes}
      employment.reload
      expect(employment.employer).to eq("Changed")
    end
  end
end
