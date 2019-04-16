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

FactoryBot.define do
  factory :bmi_calculation do
    weight { 90 }

    association :user
  end
end
