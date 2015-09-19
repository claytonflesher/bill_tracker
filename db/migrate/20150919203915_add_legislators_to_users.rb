class AddLegislatorsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :representative, :string
    add_column :users, :senator, :string
  end
end
