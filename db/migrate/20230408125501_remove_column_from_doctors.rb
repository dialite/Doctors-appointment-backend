class RemoveColumnFromDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :specialty, :string
    remove_column :doctors, :photo, :string
  end
end
