# The timecard class works like a digital timecard.
# Employees should be able to provide this information on a webform.
class Timecard < ActiveRecord::Base

  attr_accessor :weekending, :date, :hours_worked, :paycode

  # you need this line to be able to "mass assign"
  # http://stackoverflow.com/questions/10050797/rails-error-cant-mass-assign-protected-attributes
  attr_accessible :weekending, :date, :hours_worked, :paycode

  # each timecard belongs to one employee. An employee will have many timecards
  belongs_to :employee

  validates :weekending, presence: true
  validates :date, presence: true
  validates :hours_worked, presence: true
  validates :paycode, presence: true

  # these are used to determine any pay modifications
  def self.paycode_options
    %w(Vacation Sick-Leave Normal Holiday Overtime)
  end
end

