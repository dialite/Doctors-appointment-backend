class ChangeColumnNameDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :doctors, :consultation, :decimal
  end
end
