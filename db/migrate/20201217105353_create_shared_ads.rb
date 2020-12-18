class CreateSharedAds < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_ads do |t|

      t.timestamps
    end
  end
end
