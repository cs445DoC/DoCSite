class MainController < ApplicationController
  def index
  end

  def contact
  end

  def job_application
    @crime = false
    @drive = true
  end

  def job_apply
    @crime = false
    @drive = true

    name = params[:job_application][:name]
    phone = params[:job_application][:phone]
    email = params[:job_application][:email]
    crime = params[:job_application][:crime]
    drive = params[:job_application][:drive]

    if !name.empty? and !phone.empty? and !email.empty? then
      flash[:notice] = 'Application submitted successfully!'
      redirect_to '/'
    else
      flash[:notice] = 'Please fill out all required fields'
      @name = name
      @phone = phone
      @email = email
      @crime = !crime.nil?
      @drive = !drive.nil?

      render 'job_application'
    end
  end

  def generate_reports
  end
end
