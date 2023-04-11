class Appointment < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :doctor, class_name: 'Doctor', foreign_key: 'doctor_id'

  validates :city, presence: true
  validates :datetime, presence: true
  validates :user_id, presence: true
  validates :doctor_id, presence: true

  # Define a getter method for "doctor" attribute
  def doctor
    Doctor.find_by(id: self.doctor_id)&.name
  end

  # Define a setter method for "doctor" attribute
  def doctor=(name)
    doctor = Doctor.find_or_create_by(name: name)
    self.doctor_id = doctor.id
  end
end
