class FuelUsagesController < ApplicationController
 
  def new
    @fuel_usage = FuelUsage.new
  end

  def create
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
