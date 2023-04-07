class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, class_name: 'Appointment', foreign_key: 'appointment_id', dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
