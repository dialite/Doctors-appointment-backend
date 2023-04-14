class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments, dependent: :destroy

  validates :name, presence: true
  validates :lastname, presence: true
  validates :speciality, presence: true
  validates :experience, presence: true
  validates :consultation, presence: true
end
