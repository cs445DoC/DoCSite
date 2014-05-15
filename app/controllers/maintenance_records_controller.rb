class MaintenanceRecordsController < ApplicationController

  #added method new for creating new maintenance records
  def new
  end

  def create
    m = MaintenanceRecord.new
    m.date = params[:maintenance_record]['date(1i)'] + '-' + params[:maintenance_record]['date(2i)'] + '-' + params[:maintenance_record]['date(3i)']
    m.description = params[:maintenance_record][:description]
    m.license_plate = params[:maintenance_record][:license_plate]
    m.save!
    render 'users/show'
  end

  def update
  end

  def destroy
  end

  def show
  end
end
