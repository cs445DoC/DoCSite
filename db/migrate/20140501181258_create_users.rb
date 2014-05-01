class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.boolean :currently_employed
      t.boolean :boss_privelages

      t.timestamps
    end
  end
end
