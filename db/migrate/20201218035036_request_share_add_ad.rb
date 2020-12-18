class RequestShareAddAd < ActiveRecord::Migration[6.0]
  def change
    add_reference :share_requests, :ad, null: false, foreign_key: true
  end
end
