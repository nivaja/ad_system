class RequestShareUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :share_requests, :sender_id, :integer
    add_column :share_requests, :reciever_id, :integer
    # add_reference :shared_ads, :ad, null: false, foreign_key: true
    # add_reference :shared_ads, :ad, null: false, foreign_key: true
  end
end
