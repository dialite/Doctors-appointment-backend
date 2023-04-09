class AddColumnToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :gender, :string
  end
end
