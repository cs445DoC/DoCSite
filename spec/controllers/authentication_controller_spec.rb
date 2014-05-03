require 'spec_helper'

describe AuthenticationController do

  describe "GET 'change_password'" do
    it "returns http success" do
      get 'change_password'
      response.should be_success
    end
  end

  describe "GET 'forgot_password'" do
    it "returns http success" do
      get 'forgot_password'
      response.should be_success
    end
  end

  describe "GET 'password_sent'" do
    it "returns http success" do
      get 'password_sent'
      response.should be_success
    end
  end

  describe "GET 'sign_in'" do
    it "returns http success" do
      get 'sign_in'
      response.should be_success
    end
  end

  describe "GET 'signed_out'" do
    it "returns http success" do
      get 'signed_out'
      response.should be_success
    end
  end

end
