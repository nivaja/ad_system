class CreateValidations < ActiveRecord::Migration[6.0]
  def change
    create_table :validations do |t|

      t.timestamps
    end
  end
end
