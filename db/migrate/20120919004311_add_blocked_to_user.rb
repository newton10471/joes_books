class AddBlockedToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
    	t.boolean :blocked, :default => false
    end
  end
end
