class MaintenanceRecord < ActiveRecord::Base
  attr_accessible :date, :description, :license_plate
end
