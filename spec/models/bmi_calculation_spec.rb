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

require 'rails_helper'

RSpec.describe BmiCalculation, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :weight }

  it 'should not allow negative weight value' do
    body_mass = build(:bmi_calculation, weight: -33)
    expect(body_mass).not_to be_valid
  end

  it 'should calculate the rigth BMI' do
    body_mass = create(:bmi_calculation)
    expect(body_mass.index).to eq 30.42
  end

  it 'should set the right Category for Very Severely Underweight' do
    body_mass = create(:bmi_calculation, weight: 40)
    expect(body_mass.category).to eq 'very_severely_underweight'
  end

  it 'should set the right Category for Severely underweight' do
    body_mass = create(:bmi_calculation, weight: 47)
    expect(body_mass.category).to eq 'severely_underweight'
  end

  it 'should set the right Category for Underweight' do
    body_mass = create(:bmi_calculation, weight: 53)
    expect(body_mass.category).to eq 'underweight'
  end

  it 'should set the right Category for Healthy' do
    body_mass = create(:bmi_calculation, weight: 70)
    expect(body_mass.category).to eq 'healthy'
  end

  it 'should set the right Category for Overweight' do
    body_mass = create(:bmi_calculation, weight: 87)
    expect(body_mass.category).to eq 'overweight'
  end

  it 'should set the right Category for Moderately obese' do
    body_mass = create(:bmi_calculation, weight: 99)
    expect(body_mass.category).to eq 'moderately_obese'
  end

  it 'should set the right Category for Severely obese' do
    body_mass = create(:bmi_calculation, weight: 115)
    expect(body_mass.category).to eq 'severely_obese'
  end

  it 'should set the rigth Category for Very severely obese' do
    body_mass = create(:bmi_calculation, weight: 125)
    expect(body_mass.category).to eq 'very_severely_obese'
  end

  it 'should set the rigth Category for Morbidly Obese' do
    body_mass = create(:bmi_calculation, weight: 140)
    expect(body_mass.category).to eq 'morbidly_obese'
  end

  it 'should set the rigth Category for Super Obese' do
    body_mass = create(:bmi_calculation, weight: 166)
    expect(body_mass.category).to eq 'super_obese'
  end

  it 'should set the rigth Category for Hyper Obese' do
    body_mass = create(:bmi_calculation, weight: 180)
    expect(body_mass.category).to eq 'hyper_obese'
  end
end
