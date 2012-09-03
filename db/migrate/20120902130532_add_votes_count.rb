class AddVotesCount < ActiveRecord::Migration
  def up
    add_column :books, :votes_count, :integer, :null => false, :default => 0

    Book.reset_column_information
    Book.all.each do |book|
      book.update_attribute :votes_count, book.votes.length
    end
  end

  def down
    remove_column :books, :votes_count
  end
end
