class DropNullConstraintsOnUserProfiles < ActiveRecord::Migration
  def change
    change_column :user_profiles, :longitude,       :float,   :null => true
    change_column :user_profiles, :latitude,        :float,   :null => true
    change_column :user_profiles, :house_district,  :integer, :null => true
    change_column :user_profiles, :senate_district, :integer, :null => true
    change_column :user_profiles, :state,           :string,  :null => true
    change_column :user_profiles, :representative,  :string,  :null => true
    change_column :user_profiles, :senator,         :string,  :null => true
  end
end
