require 'spec_helper'

describe MaintenanceRecordsController do
let(:mrid) { 4 }

  let(:tdate) { "May 20 2014" }
  let(:tdescription) { "Blah Blah Blah" }
  let(:tlicense_plate) { "ABCDEFG" }

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update', :id => mrid
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => mrid
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => mrid
      response.should be_success
    end
  end

  describe "#new" do
    it "should render view elements for maintenance record" do
      get :new
      expect(response).to render_template("new")  
    end
  end

  describe "#create" do
    context "all field inputs are valid, successful submission" do
      it "should be a successful submission since all fields are valid" do
        post :create
        expect(response).to render_template("users/show") 
      end
      it "should add the created model to the database" do
        expect(MaintenanceRecord.count).to eq(0)        
        MaintenanceRecord.create(date: tdate, description: tdescription, license_plate: tlicense_plate)
        expect(MaintenanceRecord.count).to eq(1)
      end
    end
    context "all field inputs are invalid, unsuccessful submission" do
      it "should be an unsuccessful submission since some fields are invalid" do
        expect(MaintenanceRecord.count).to eq(0)        
        MaintenanceRecord.create(date: nil, description: tdescription, license_plate: nil)
        expect(MaintenanceRecord.count).to eq(0)
      end
    end
  end
  describe "#show" do
    it "should render the show maintenance record form" do
      get :show, :id => 1
      expect(response).to render_template("show")    
    end 
  end

end
