class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

  def dashboard
    @bmi_calculations = current_user.bmi_calculations.order(:id)
    @last_bmi = @bmi_calculations.last.try(:index)
  end
end
