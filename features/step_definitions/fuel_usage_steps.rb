# Add a declarative step here for populating the DB with movies.

Given /the following fuel usages exist:/ do |fuel_usages_table|
  fuel_usages_table.hashes.each do |fuel_usage|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    FuelUsage.create(date:fuel_usage["date"],gallons:fuel_usage["gallons"],license_plate:fuel_usage["license_plate"],mileage:fuel_usage["mileage"])

  end

end

