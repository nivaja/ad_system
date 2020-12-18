class CreateShareRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :share_requests do |t|
      t.string :status

      t.timestamps
    end
  end
end
