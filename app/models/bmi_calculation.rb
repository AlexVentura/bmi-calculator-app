class BmiCalculation < ApplicationRecord
  belongs_to :user
  belongs_to :bmi_category
end
