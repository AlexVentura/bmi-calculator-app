# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  height                 :float            default(0.0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    email { 'example@gmail.com' }
    password { 'Please11' }
    password_confirmation { 'Please11' }
    first_name { 'Alex' }
    last_name { 'Ventura' }
    height { 1.72 }
  end
end
