require "rails_helper"

RSpec.describe "User", type: :request do
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }

  describe "GET /user" do
    it "returns a success response" do
      get users_path
      expect(response).to be_successful
    end
  end

  describe "GET /user/new" do
    it "returns a success response" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "GET /user/edit" do
    it "returns a success response" do
      user = create(:user)
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "POST /users" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post users_path, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {user: {first_name: "", last_name: "Doe", email: "qari@hotmail.com"}}
      end

      it "does not create a new User" do
        expect {
          post users_path, params: invalid_params
        }.to change(User, :count).by(0)
      end

      it "returns an unprocessable entity response" do
        post users_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT/PATCH #update" do
    it "updates User successfully" do
      user = User.create(valid_attributes)
      valid_attributes[:email] = "email@changed.com"
      put user_path(user), params: {user: valid_attributes}
      user.reload
      expect(user.email).to eq("email@changed.com")
    end
  end
end
