class AddColumnToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :lastname, :string
    add_column :doctors, :speciality, :string
    add_column :doctors, :experience, :integer
    add_column :doctors, :consultation, :integer
    add_column :doctors, :image, :string
  end
end
