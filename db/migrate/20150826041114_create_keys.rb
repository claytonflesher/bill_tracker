class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :api, null: false
      t.string :key, null: false

      t.timestamps null: false
    end
  end
end
