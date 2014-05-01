class CreateMaintenanceRecords < ActiveRecord::Migration
  def up
    create_table :maintenance_records do |t|
      t.date :date
      t.string :license_plate
      t.string :description

      t.timestamps
    end
  end

  def down
    droptable :maintenance_records
  end
end
