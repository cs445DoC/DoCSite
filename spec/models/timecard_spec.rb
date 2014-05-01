require 'spec_helper'

describe Timecard do
  
let(:tc) { Timecard.create(weekending: Date.current, date: Date.current, hours_worked: 4, paycode: 'Normal') }

  it "is invalid without a weekending date" do

	tc.weekending = nil
	expect(tc.valid?).to eq(false)

  end
  it "is invalid without a date" do
	tc.date = nil
	expect(tc.valid?).to eq(false)
  end
  it "is invalid without hours_worked" do
	tc.hours_worked = nil
	expect(tc.valid?).to eq(false)
  end
  it "is invalid without a paycode" do
	tc.paycode = nil
	expect(tc.valid?).to eq(false)
  end
end
