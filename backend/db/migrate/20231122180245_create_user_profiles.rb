class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :profile_image

      t.timestamps
    end
    add_index :user_profiles, :username, unique: true
  end
end
