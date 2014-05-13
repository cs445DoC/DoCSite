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

end
