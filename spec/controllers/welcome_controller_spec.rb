require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "returns http status success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do
    before :each do
      @user = create(:user)
    end

    it "returns http status success with signed user" do
      sign_in @user

      get :dashboard
      expect(response).to have_http_status(:success)
    end

    it "returns http status redirect to sign in url" do
      get :dashboard
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/users/sign_in")
    end
  end
end
