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
