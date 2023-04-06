class AddDoctorRefToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :doctor, null: false, foreign_key: { to_table: 'doctors', on_delete: :cascade }
  end
end
