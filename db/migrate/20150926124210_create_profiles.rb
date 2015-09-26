class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string   :address,         null: false
      t.float    :longitude,       null: false
      t.float    :latitude,        null: false
      t.integer  :house_district,  null: false
      t.integer  :senate_district, null: false
      t.string   :state,           null: false
      t.string   :representative,  null: false
      t.string   :senator,         null: false
      t.integer  :user_id,         null: false
      t.timestamps null: false
    end
    add_index :user_profiles, :user_id
  end
end
