class RemoveColumnFromDoctor < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :gender, :string
  end
end
