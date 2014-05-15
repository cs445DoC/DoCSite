require 'spec_helper'

describe FuelUsage do

let(:fu) { FuelUsage.create(date: Date.current, license_plate: '370455V', mileage: 600, gallons: 12) }

  it "is invalid without a date" do
	fu.date = nil
	expect(fu.valid?).to eq(false)
  end
  it "is invalid without a license_plate" do
	fu.license_plate = nil
	expect(fu.valid?).to eq(false)
  end
  it "is invalid without mileage" do
	fu.mileage = nil
	expect(fu.valid?).to eq(false)
  end
  it "is invalid without a gallons" do
	fu.gallons = nil
	expect(fu.valid?).to eq(false)
  end

end
