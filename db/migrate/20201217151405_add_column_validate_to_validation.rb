class AddColumnValidateToValidation < ActiveRecord::Migration[6.0]
  def change
    add_column :validations, :validate, :boolean,  default: false
  end
end
