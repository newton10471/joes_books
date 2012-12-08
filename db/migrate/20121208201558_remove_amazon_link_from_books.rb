class RemoveAmazonLinkFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :amazon_link
  end

  def down
    add_column :books, :amazon_link, :string
  end
end
