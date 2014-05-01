class CreateFuelUsages < ActiveRecord::Migration
  def up
    create_table :fuel_usages do |t|
      t.datetime :date
      t.string :license_plate
      t.float :mileage
      t.float :gallons

      t.timestamps
    end
  end

  def down
	droptable :fuel_usages
  end
end
