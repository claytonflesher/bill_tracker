class DeleteUserIdFromBills < ActiveRecord::Migration
  def change
    remove_index :bills, :user_id
    remove_column :bills, :user_id
  end
end
