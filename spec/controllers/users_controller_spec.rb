require 'spec_helper'

describe UsersController do

let (:uid) { 4 } 
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
      get 'update', :id => uid
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :id => uid
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => uid
      response.should be_success
    end
  end

end
