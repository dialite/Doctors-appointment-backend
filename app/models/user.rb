class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy

  validates :username, presence: true

  # def admin?
  #   role.present? && role == 'admin'
  # end
end
