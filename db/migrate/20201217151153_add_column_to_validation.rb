class AddColumnToValidation < ActiveRecord::Migration[6.0]
  def change
    add_column :validations, :start, :boolean, default: false
    add_column :validations, :mid, :boolean,  default: false
    add_column :validations, :end, :boolean,  default: false
  end
end
