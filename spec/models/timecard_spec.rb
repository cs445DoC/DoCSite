require 'spec_helper'

describe Timecard do
  
let(:tc) { Timecard.create(weekending: Date.current, date: Date.current, hours_worked: 4, paycode: 'Normal') }

  it "is invalid without a weekending date" do

	tc.weekending = nil
	expect(tc.valid?).to eq(false)

  end
  it "is invalid without a date" do

  end
  it "is invalid without hours_worked" do

  end
  it "is invalid without a paycode" do

  end
end
