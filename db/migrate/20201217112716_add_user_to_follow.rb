class AddUserToFollow < ActiveRecord::Migration[6.0]
  def change
    add_reference :follows, :user, null: false, foreign_key: true
  end
end
