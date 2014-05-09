class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column  :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :encrypted_password, :string
      t.column :currently_employed, :boolean, :default => true
      t.column :boss_privileges, :boolean, :default => false

      t.timestamps
    end
  end

  def down
	droptable :users
   end
end
