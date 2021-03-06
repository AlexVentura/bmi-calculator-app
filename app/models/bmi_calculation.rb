# == Schema Information
#
# Table name: bmi_calculations
#
#  id         :bigint(8)        not null, primary key
#  weight     :float
#  index      :float
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#

class BmiCalculation < ApplicationRecord
  CATEGORIES = {
    very_severely_underweight: 0,
    severely_underweight: 15,
    underweight: 16,
    healthy: 18.5,
    overweight: 25,
    moderately_obese: 30,
    severely_obese: 35,
    very_severely_obese: 40,
    morbidly_obese: 45,
    super_obese: 50,
    hyper_obese: 60
  }.freeze

  belongs_to :user

  validates_presence_of :weight
  validates :weight, numericality: { greater_than: 0 }

  before_save :calculate_body_mass_index, :set_category

  private

  def calculate_body_mass_index
    self.index = (weight / (user.height ** 2)).round(2)
  end

  def set_category
    self.category = CATEGORIES.select { |k, v| v <= index }.to_a.last.first
  end
end
