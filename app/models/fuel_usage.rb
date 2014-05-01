class FuelUsage < ActiveRecord::Base

   attr_accessor :date, :gallons, :license_plate, :mileage
   attr_accessible :date, :gallons, :license_plate, :mileage

   validates :date, presence: true
   validates :gallons, presence: true
   validates :license_plate, presence: true
   validates :mileage, presence: true
 
end
