require 'rails_helper'

RSpec.describe BmiCalculationsController, type: :controller do
  before :each do
    @user = create(:user)
  end

  describe 'POST #create' do
    it 'shows Weight flash error message' do
      sign_in @user

      post :create, params: { bmi_calculation: { height: 1.72 } }
      expect(controller).to set_flash.now[:alert]
    end
  end
end
