class AddDistrictsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :house_district, :integer
    add_column :users, :senate_district, :integer
  end
end
