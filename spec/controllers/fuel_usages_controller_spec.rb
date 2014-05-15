require 'spec_helper'

describe FuelUsagesController do
  let(:good_date) { "May 20 2014" }
  let(:good_license) { "heyBr0" }
  let(:good_miles) { 50 }
  let(:good_gallons) { 12 }

 let(:fuid) { 4 }
  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update', :id => fuid
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => fuid
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => fuid
      response.should be_success
    end
  end

  describe "#new" do
    it "should render the new fuel usages form" do
      get :new
      expect(response).to render_template("new")    
    end
  end

  describe "#show" do
    it "should render the show fuel usages form" do
      get :show, :id => 1
      expect(response).to render_template("show")    
    end
  end

  describe "#create" do
    context "all field inputs are valid, successful submission" do

      it "should render the employee homepage" do
        post :create
        expect(response).to render_template("users/show")    
      end

      it "should add the created model to the database" do
        expect(FuelUsage.count).to eq(0)
        
        FuelUsage.create(date: good_date, license_plate: good_license, mileage: good_miles, gallons: good_gallons)

        expect(FuelUsage.count).to eq(1)
      end
    end
    context "not all field inputs are valid, unsuccessful submission" do
      it "should not submit a new record to the database" do
         expect(FuelUsage.count).to eq(0)
        
        FuelUsage.create(date: nil, license_plate: good_license, mileage: good_miles, gallons: good_gallons)

        expect(FuelUsage.count).to eq(0) 
      end
    end
  end

end
