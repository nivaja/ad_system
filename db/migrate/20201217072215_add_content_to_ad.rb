class AddContentToAd < ActiveRecord::Migration[6.0]
  def change
    add_column :ads, :content, :text
  end
end
