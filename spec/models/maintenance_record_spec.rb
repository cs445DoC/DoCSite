require 'spec_helper'

describe MaintenanceRecord do
  let(:mr) { MaintenanceRecord.create( date: Date.current, description: 'We did stuff', license_plate: '370455V') }

  it "is invalid without a date" do
	mr.date = nil
	expect(mr.valid?).to eq(false)
  end
  it "is invalid without description" do
	mr.description = nil
	expect(mr.valid?).to eq(false)
  end
  it "is invalid without a license_plate" do
	mr.license_plate = nil
	expect(mr.valid?).to eq(false)
  end
end
