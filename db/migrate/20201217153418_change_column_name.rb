class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :validations, :validate, :watched
  end
end
