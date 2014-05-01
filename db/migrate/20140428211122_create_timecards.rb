class CreateTimecards < ActiveRecord::Migration
    def up
	create_table :timecards do |t|
      	t.date :weekending
      	t.date :date
      	t.float :hours_worked
      	t.string :paycode

      	t.timestamp
  	end
    end
    def down
	drop_table :timecards
    end
end

