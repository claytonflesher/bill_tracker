class AddVerificationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verification_token, :string
    add_column :users, :verified_at,        :timestamp
  end
end
