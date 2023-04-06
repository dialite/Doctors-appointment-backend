class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.text :description

      t.timestamps
    end
  end
end
