class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bmi_calculations

  validates_presence_of :first_name, :last_name, :height
  validates_numericality_of :height, size: { greater_than: 0 }
end
