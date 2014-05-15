require 'spec_helper'

describe TimecardsController do

  let(:tcid) { 1 }

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
      
    end
  end

  describe "#create" do
    context "all field inputs are valid, successful submission" do
      it "should be an successful submission since all fields are valid" do
        
      end
    end
    context "all field inputs are invalid, unsuccessful submission" do
      it "should be an unsuccessful submission since some fields are invalid" do
      end
    end
  end

  describe "#update" do

  end

  describe "#destroy" do

  end

  describe "#show" do

  end

end
