class ChangeColumnGetBookOnAmazonUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :getBookOnAmazonUrl, :amazon_url
  end
end
