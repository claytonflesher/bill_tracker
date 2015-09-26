class RemoveProfileDataFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :longitude
    remove_column :users, :latitude
    remove_column :users, :house_district
    remove_column :users, :senate_district
    remove_column :users, :state
    remove_column :users, :representative
    remove_column :users, :senator
  end
end
