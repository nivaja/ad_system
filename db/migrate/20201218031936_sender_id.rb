class SenderId < ActiveRecord::Migration[6.0]
  def change
    add_column :share_request, :sender_id, :integer
    add_column :share_request, :reciever_id, :integer
    # add_reference :shared_ads, :ad, null: false, foreign_key: true
    # add_reference :shared_ads, :ad, null: false, foreign_key: true

  end
end
