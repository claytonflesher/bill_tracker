class CreateBillSubscriptions < ActiveRecord::Migration
  def change
    create_table :bill_subscriptions do |t|
      t.integer :user_id
      t.integer :bill_id

      t.timestamps null: false
    end
    add_index :bill_subscriptions, :user_id
    add_index :bill_subscriptions, :bill_id
    add_foreign_key :bill_subscriptions, :users
    add_foreign_key :bill_subscriptions, :bills
  end
end
