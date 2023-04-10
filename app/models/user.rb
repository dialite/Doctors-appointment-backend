class User < ApplicationRecord

  has_many :appointments, class_name: 'Appointment', foreign_key: 'appointment_id', dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  validates :username, presence: true

  def admin?
    role.present? && role == 'admin'
  end
end
