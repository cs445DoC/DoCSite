class TimecardsController < ApplicationController
  def new
    @timecard = Timecard.new
  end

  def create
    render 'users/show'
  end

  def update
  end

  def destroy
  end

  def show
  end

  def generate_report
  end
end
