require 'spec_helper'

describe TimecardsController do

  let(:tcid) { 1 }

  let(:tweekending) { "May 20 2014" }
  let(:tdate) { "May 20 2014" }
  let(:thours_worked) { 5 }
  let(:tpaycode) { "normal" }

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update', :id => tcid
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => tcid
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => tcid
      response.should be_success
    end
  end

  describe "#new" do
    it "should render view elements for timecard" do
      get :new
      expect(response).to render_template("new")  
    end
  end

  describe "#create" do
    context "all field inputs are valid, successful submission" do
      it "should be an successful submission since all fields are valid" do
        post :create
        expect(response).to render_template("users/show") 
      end
      it "should add the created model to the database" do
        expect(Timecard.count).to eq(0)        
        Timecard.create(weekending: tweekending, date: tdate, hours_worked: thours_worked, paycode: tpaycode)
        expect(Timecard.count).to eq(1)
      end
    end
    context "all field inputs are invalid, unsuccessful submission" do
      it "should be an unsuccessful submission since some fields are invalid" do
        expect(Timecard.count).to eq(0)        
        Timecard.create(weekending: tweekending, date: nil, hours_worked: thours_worked, paycode: nil)
        expect(Timecard.count).to eq(0)
      end
    end
  end
  describe "#show" do
    it "should render the show timecard form" do
      get :show, :id => 1
      expect(response).to render_template("show")    
    end 
  end
end
