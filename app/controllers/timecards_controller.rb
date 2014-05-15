class TimecardsController < ApplicationController
  def new
  end

  def create
    t = Timecard.new
    t.weekending = params[:timecard]['weekending(1i)'] + '-' + params[:timecard]['weekending(2i)'] + '-' + params[:timecard]['weekending(3i)']
    t.date = params[:timecard]['date(1i)'] + '-' + params[:timecard]['date(2i)'] + '-' + params[:timecard]['date(3i)']
    t.hours_worked = params[:timecard][:hours_worked]
    t.paycode = params[:timecard][:paycode]
    t.save!
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
