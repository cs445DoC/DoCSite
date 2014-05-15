# Add a declarative step here for populating the DB with movies.

Given /the following timecards exist:/ do |timecards_table|
  timecards_table.hashes.each do |timecard|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Timecard.create(weekending:timecard["weekending"],date:timecard["date"],hours_worked:timecard["hours_worked"],paycode:timecard["paycode"])
  end
end

