# The timecard class works like a digital timecard.
# Employees should be able to provide this information on a webform.
class Timecard < ActiveRecord::Base

  attr_accessor :weekending, :date, :hours_worked, :paycode

  belongs_to :employee

  def self.paycode_options
    %w(Vacation Sick-Leave Normal Holiday)
  end


