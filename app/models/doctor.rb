class Doctor < ApplicationRecord
  has_many :appointments, class_name: 'Appointment', foreign_key: 'appointment_id', dependent: :destroy
  has_many :users, through: :appointments, dependent: :destroy
end
