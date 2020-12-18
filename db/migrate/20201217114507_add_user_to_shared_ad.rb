class AddUserToSharedAd < ActiveRecord::Migration[6.0]
  def change
    add_reference :shared_ads, :user, null: false, foreign_key: true
  end
end
