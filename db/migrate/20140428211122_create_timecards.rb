class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.Date :weekending
      t.Date :date
      t.double :hours_worked
      t.string :paycode

      t.timestamps
    end
  end
end
