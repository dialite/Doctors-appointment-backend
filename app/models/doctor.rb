class Doctor < ApplicationRecord
  include ActionView::Helpers
  has_many :appointments, class_name: 'Appointment', foreign_key: 'appointment_id', dependent: :destroy
  has_many :users, through: :appointments, dependent: :destroy

  validates :name, presence: true
  validates :lastname, presence: true
  validates :speciality, presence: true
  validates :experience, presence: true
  validates :consultation, presence: true

  def default_values
    self.image = case gender
                   when 'M', 'Male', 'm', 'male'
                     ActionController::Base.helpers.image_tag('male-placeholder.jpg', alt: 'Male Placeholder')
                   else
                     ActionController::Base.helpers.image_tag('female-placeholder.jpg', alt: 'Female Placeholder')
                   end
    picture
  end
end
