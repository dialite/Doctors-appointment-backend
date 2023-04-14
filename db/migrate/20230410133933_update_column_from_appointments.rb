class UpdateColumnFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :appointment_date, :date
    remove_column :appointments, :appointment_time, :time
    remove_column :appointments, :description, :string
    add_column :appointments, :city, :string
  end
end
