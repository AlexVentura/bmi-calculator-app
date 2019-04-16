FactoryBot.define do
  factory :bmi_calculation do
    weight { 90 }

    association :user
  end
end
