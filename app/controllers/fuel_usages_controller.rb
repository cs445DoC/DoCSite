class FuelUsagesController < ApplicationController
 
  def new
    @fuel_usage = FuelUsage.new
  end

  def create
    m = FuelUsage.new
    m.date = params[:fuel_usage]['date(1i)'] + '-' + params[:fuel_usage]['date(2i)'] + '-' + params[:fuel_usage]['date(3i)']
    m.mileage = params[:fuel_usage][:mileage]
    m.gallons = params[:fuel_usage][:gallons]
    m.license_plate = params[:fuel_usage][:license_plate]
    m.save!
    render 'users/show'
  end

  def update
  end

  def show
  end

  def destroy
  end

  def generate_report
  end
end
