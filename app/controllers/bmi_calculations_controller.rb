class BmiCalculationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @bmi_calculation = BmiCalculation.new
  end

  def create
    @bmi_calculation = BmiCalculation.new(bmi_calculations_params)
    @bmi_calculation.user = current_user

    if @bmi_calculation.save
      redirect_to dashboard_path, notice: 'BMI was successfully created.'
    else
      flash.now[:alert] = @bmi_calculation.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def bmi_calculations_params
    params.require(:bmi_calculation).permit(:weight)
  end
end
