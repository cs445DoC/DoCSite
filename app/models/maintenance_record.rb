class MaintenanceRecord < ActiveRecord::Base
  attr_accessor :date, :description, :license_plate
  attr_accessible :date, :description, :license_plate

  validates :date, presence: true
  validates :description, presence: true
  validates :license_plate, presence: true

end
